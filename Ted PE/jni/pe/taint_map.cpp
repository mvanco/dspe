#include <stdio.h>
#include <string.h>

#include <string>
#include <vector>
#include <list>
#include <map>
#include <sstream>

#include "logging.h"
#include "utilities.h"
#include "sha256.h"

using namespace std;

/**
 * SETTINGS FROM PE Private Files Configuration Application
 */
// 0-none, 1-use hashes, 2-use hashes and content of files
int SCANNING_TYPE = 1;

// 0-none, 1-confirmation dialog, 2-application termination
int RESTRICTION_TYPE = 1; //should be obtainable in Java code

// 0-none, 1-communication mediation, 2-file protection, 3-both
int RESTRICTION_METHOD = 3;

// 0-none, 1-empty, 2-fake
int THREAT_LEVEL = 0; //in increased state, all files reading is mocked

// 0-turned off, 1-turned on
int ENABLED_LOGGING = 0;


// if 0 content of file (small blocks) is not used, otherwise used this size for division
#define SMALL_BLOCK_SIZE 4

// if 0 hashes are not used, otherwise used only when memory block is equally sized or bigger
#define MIN_BLOCK_SIZE (SMALL_BLOCK_SIZE)

#define SIZE_OF_HASH 32




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * DECLARATIONS
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*
 * Represents file on the file system which is stored as tainted with the logical timestamp
 */
class TaintedFile
{
public:
    unsigned long long time; //for testing and further extensions with tracking all paths
    string path;

    static TaintedFile create(string path);
    static bool isTaintedFile(string path);
    static bool foundInVector(string path, vector<TaintedFile> *vec);
    static bool hasPrivateContent(unsigned char *hash);
};
vector<TaintedFile> privateFiles; // absolute paths of user-selected files, protected against removal!!!
vector<TaintedFile> taintedFiles; //absolute paths of newly tainted files

unsigned long long globalTime = 0;
bool isMasked = false;



/*
 * Represents part of file content for tainting mechanism
 */
class SmallBlock   //could be string, but this is more memory efficient and faster for processing
{
public:
    unsigned long start; //id of block
    char block[SMALL_BLOCK_SIZE];
};
vector<SmallBlock *> smallBlocks;


/*
 * Represents memory block in LAS
 */
class MemBlock   //methods move to class and rewrite to static
{
public:
    unsigned long start; /* start address */
    int size; /* size of memory block */
    int fdSrc; /* source file descriptor */
    TaintedFile fpSrc; /* full path of source file - do not have to be but verify! */
    unsigned char hash[SIZE_OF_HASH + 1]; /* counted hash, 32B including '\0' character */


    static MemBlock *add(int result, int file, void *buffer);
    static MemBlock *isOverlapping(unsigned long buffer, int readSize);
    static void untaint(int fd);
    static void createSmallBlocks(const void *buffer, int readSize, unsigned long start);
    static bool foundInSmallBlocks(const void *buffer, int readSize, unsigned long &foundBlock);
    static bool isTaintedBlock(const void *buffer, int result, unsigned char hash[32]);
    static void cutBlock(MemBlock *block, const void *buffer, int size);
    static void pushBlock(MemBlock *block);
    static void printAll();
    static string getPrint();
};
vector<MemBlock *> taintMap;


/*
 * Stores information about file according to file descriptor key
 */
class FileInfo
{
public:
    int mode;
    int flags;
    string path;

    static void add(int fd, const char *file, int flages, int mode);
    static void printAll();
    static string getPrint();
};
map<int, FileInfo *> fileMap; // key is like indexted fd parameter





/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * TAINTED FILE FUNCTIONS
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*
 * Creates tainted file with logical timestamp
 */
TaintedFile TaintedFile::create(string path)
{
    TaintedFile *result = new TaintedFile;

    result->path = path;
    result->time = globalTime;

    globalTime = globalTime + 1;

    return *result;
}

/*
 * Checks if the file is tainted according to actually filled tainting structures
 */
bool TaintedFile::isTaintedFile(string path)
{
    vector<TaintedFile>::iterator i;
    for (i = privateFiles.begin(); i < privateFiles.end(); i++) {
        if (is_dir(i->path.c_str())) {
            if ( path.compare(0, i->path.length(), i->path) == 0 ) { //if is selected folder as private
                return true;
            }
        }
        else {
            if (i->path == path) {
                return true;
            }
        }
    }

    for (i = taintedFiles.begin(); i < taintedFiles.end(); i++) {
        if (i->path == path) {
            return true;
        }
    }

    return false;
}

/*
 * Checks if the tainted file is found in specified vector
 */
bool TaintedFile::foundInVector(string path, vector<TaintedFile> *vec)
{
    vector<TaintedFile>::iterator it;
    for (it = vec->begin(); it < vec->end(); it++) {
        if (it->path == path) {
            return true;
        }
    }

    return false;
}

/*
 * Compares database of hashes with current hash
 */
bool TaintedFile::hasPrivateContent(unsigned char *hash)
{
    //searching according to hash
    vector<MemBlock *>::iterator it;
    for (it = taintMap.begin(); it != taintMap.end(); it++) {   //searching in hash database
        if (memcmp(hash, (*it)->hash, 32) == 0) {        //strings are equal
            return true;
        }
    }

    return false;
}





/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * FILE INFO FUNCTIONS
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*
 * Adds an new file into fileMap database
 */
void FileInfo::add(int fd, const char *file, int flags, int mode)
{
    FileInfo *fileInfo = new FileInfo;

    //new

    fileInfo->path = string(file);
    fileInfo->flags = flags;
    fileInfo->mode = mode;

    fileMap[fd] = fileInfo;

    //map<int, FileInfo *>::iterator it = fileMap.begin();
    //fileMap.insert(it, pair<int, FileInfo *>(fd, fileInfo));
}

/*
 * Prints fileMap database
 */
void FileInfo::printAll()
{
    map<int, FileInfo *>::iterator it;
    for (it = fileMap.begin(); it != fileMap.end(); it++) {
        int fd = it->first;
        FileInfo *file = it->second;
        log_to_file(LOG_FILE_TAINTMAP, "fd: %u, mode: %d, flags: %d, path: %s", fd, file->mode, file->flags, file->path.c_str());

    };
}

/*
 * Returns string which represents printed fileMap database
 */
string FileInfo::getPrint()
{
    std::ostringstream ret;
    map<int, FileInfo *>::iterator it;
    for (it = fileMap.begin(); it != fileMap.end(); it++) {
        int fd = it->first;
        FileInfo *file = it->second;
        ret << "fd: " << fd << ", mode: " << file->mode << ", flags: " << file->flags << ", path: " << file->path << "\n";

    };
    return ret.str();
}





/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * MEMORY BLOCK FUNCTIONS
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*
 * Adds new memory block into taintMap database
 */
MemBlock *MemBlock::add(int result, int file, void *buffer)
{
    MemBlock *block = new MemBlock;

    block->start = (unsigned long) buffer;
    //block->start = 4294959600; //TESTING FILE-TAINTING

    block->size = result;
    block->fdSrc = file;

    unsigned char hash[32];
    SHA256_CTX ctx;
    sha256_init(&ctx);
    sha256_update(&ctx, (unsigned char *) buffer, result);
    sha256_final(&ctx, hash);
    strcpy((char *) block->hash, (char *) hash);

    //createSmallBlocks(buffer, result, block);

    taintMap.push_back(block);
    return block;
}

/*
 * Checks if the memory block is overalapping with another
 */
MemBlock *MemBlock::isOverlapping(unsigned long buffer, int readSize)
{
    unsigned long currentStart = buffer;
    //unsigned int currentStart = 4294959600; //TESTING FILE-TAINTING

    unsigned long currentEnd = currentStart + readSize; //in result is count of read bytes

    //printf("curr: %u %u", currentStart, currentEnd);

    MemBlock *foundBlock = NULL;
    vector<MemBlock *>::iterator it;
    for (it = taintMap.begin(); it < taintMap.end(); it++) {
        //(*it)->start, (*it)->size, (*it)->fdSrc, fileMap[(*it)->fdSrc]->path.c_str()
        unsigned long comparedStart = (*it)->start;
        unsigned long comparedEnd = (*it)->start + (*it)->size;

        //looking if compared is out of the current
        if ((comparedStart < currentStart && comparedEnd < currentStart) || (comparedStart > currentEnd && comparedEnd > currentEnd)) {
            continue; //it is outside, looking for other
        } else { //found, it is overlapping
            return *it;
        }
    };

    return NULL; //not found
}

/*
 * Removes memory block from tainting structures
 */
void MemBlock::untaint(int fd)
{

    vector<TaintedFile>::iterator i;
    for (i = taintedFiles.begin(); i < taintedFiles.end(); i++) {
        if (i->path == fileMap[fd]->path) {
            taintedFiles.erase(i);
        }
    }
}

/*
 * Generates all Small Blocks for given memory block
 */
void MemBlock::createSmallBlocks(const void *buffer, int readSize, unsigned long start)
{
    for (int i = 0; i < ((int) readSize / SMALL_BLOCK_SIZE); i++) {
        unsigned long newBlockStart = (unsigned long) buffer + i * SMALL_BLOCK_SIZE;
        unsigned long newBlockEnd = newBlockStart + SMALL_BLOCK_SIZE;

        SmallBlock *newBlock = new SmallBlock;
        memcpy((void *) newBlock->block, ((char *) buffer) + (i * SMALL_BLOCK_SIZE), SMALL_BLOCK_SIZE);
        newBlock->start = start;


        smallBlocks.push_back(newBlock);
    }
}

/*
 * Searches given Small Block in database of all Small Blocks
 */
bool MemBlock::foundInSmallBlocks(const void *buffer, int readSize, unsigned long &foundBlock)
{
    vector<SmallBlock *>::iterator it;
    for (it = smallBlocks.begin(); it != smallBlocks.end(); it++) {   //searching in Small Blocks database
        for (int i = 0; i < (readSize - SMALL_BLOCK_SIZE + 1); i++) {
            if (memcmp(((char *) buffer) + i, (*it)->block, SMALL_BLOCK_SIZE) == 0) {           //memory blocks are equal
                foundBlock = (*it)->start;
                return true;
            }
        }
    }
    return false;
}

/*
 * Checks whether the current block is tainted according to tainting structures
 */
bool MemBlock::isTaintedBlock(const void *buffer, int result, unsigned char hash[32])
{
    unsigned long currentStart = (unsigned long) buffer;
    unsigned long currentEnd = currentStart + result; //in result is count of read bytes
    
    /*
     * Searching according to memory boundaries - NOT EFFICIENT
     */
    /*
    vector<MemBlock *>::iterator it;
    for (it = taintMap.begin(); it < taintMap.end(); it++) {
        //(*it)->start, (*it)->size, (*it)->fdSrc, fileMap[(*it)->fdSrc]->path.c_str()
        unsigned long comparedStart = (*it)->start;
        unsigned long comparedEnd = (*it)->start + (*it)->size;

        //looking if compared is out of the current
        if ((comparedStart < currentStart && comparedEnd < currentStart) || (comparedStart > currentEnd && comparedEnd > currentEnd)) {
            continue; //it is outside, looking for other
        } else { //found, it is overlapping
            return true;
        }
    }
    */
    
    /*
     * Searching according to hashes
     */
    if (TaintedFile::hasPrivateContent(hash)) {
        return true;
    }
    
    /*
     * Searching according to Small Blocks
     */
    if (SCANNING_TYPE == 2) {
        unsigned long notUsed;
        return foundInSmallBlocks(buffer, result, notUsed);
    }
    else {
        return false;
    }
}

/*
 * Treats part of memories of current memory blocks to create space for new (not needed)
 */
void MemBlock::cutBlock(MemBlock *block, const void *buffer, int size)
{
    unsigned long blockStart = (unsigned long) block->start;
    unsigned long blockEnd = (unsigned long) block->start + block->size;
    unsigned long bufferStart = (unsigned long) buffer;
    unsigned long bufferEnd = (unsigned long) buffer + size;


    if (blockStart < bufferStart && blockEnd > bufferEnd) {   //divide into two blocks
        block->size = bufferStart; //trim from right;
        //createSmallBlocks((const void *) block->start, block->size, block);

        MemBlock *newBlock = new MemBlock;
        newBlock->start = bufferEnd;
        newBlock->size = blockEnd - bufferEnd;
        newBlock->fdSrc = block->fdSrc;
        newBlock->fpSrc = block->fpSrc;
        //createSmallBlocks((const void *) newBlock->start, newBlock->size, newBlock);
    } else if (blockStart > bufferStart && blockEnd < bufferEnd) {   //remove block
        //taintMap.erase(block);
    } else if (bufferStart > blockStart && bufferStart < blockEnd) {   //should be cut from right
        block->size = blockStart;
        //createSmallBlocks((const void *) block->start, block->size, block);
    } else if (bufferEnd > blockStart && bufferEnd < blockEnd) {   //should be cut from left
        block->start = bufferEnd;
        block->size = block->size - size;
        //createSmallBlocks((const void *) block->start, block->size, block);
    }

}

/*
 * Archives and pushes new block into taintMap database
 */
void MemBlock::pushBlock(MemBlock *block) {
    MemBlock *overlappingBlock = isOverlapping(block->start, block->size);
    if (overlappingBlock != NULL) {
        overlappingBlock->start = 0; //archivate all old blocks on address 0 due to still useful hashes
        overlappingBlock->size = 0;
    }

    taintMap.push_back(block);
}

/*
 * Prints all memory blocks into log file
 */
void MemBlock::printAll()
{
    vector<MemBlock *>::iterator it;
    for (it = taintMap.begin(); it != taintMap.end(); it++) {

        char path[255];
        //strcpy(path, "(removed)");
        if (fileMap.find((*it)->fdSrc) == fileMap.end()) {
            strcpy(path, "N/A");
        } else {
            strcpy(path, fileMap[(*it)->fdSrc]->path.c_str());
        }

        char hash_byte[3];
        char hash[33] = { 0 };
        for (int i = 0; i < 32; i += 2) {   //printed all hash
            snprintf(hash_byte, 3, "%02X", (*it)->hash[i]);
            hash[i] = hash_byte[0];
            hash[i + 1] = hash_byte[1];
        }

        log_to_file(LOG_FILE_TAINTMAP, "start: %lu, size: %d, fd_src: %d, fp_src: %s, hash: %s, smallblocks: ", (*it)->start, (*it)->size, (*it)->fdSrc, path, hash);

        char printedSmallBlock[SMALL_BLOCK_SIZE * 3 + 5];
        vector<SmallBlock *>::iterator it3;
        for (it3 = smallBlocks.begin(); it3 != smallBlocks.end(); it3++) {
            if ((*it3)->start == (*it)->start) {
                buffer_to_string(printedSmallBlock, SMALL_BLOCK_SIZE * 3 + 5, (*it3)->block, SMALL_BLOCK_SIZE);
                log_to_file(LOG_FILE_TAINTMAP, "%s", printedSmallBlock);
            }
        }
    };
}

/*
 * Returns string which represents printed memory blocks
 */
string MemBlock::getPrint()
{

    std::ostringstream ret;

    vector<MemBlock *>::iterator it;
    for (it = taintMap.begin(); it != taintMap.end(); it++) {

        char path[255];
        //strcpy(path, "(removed)");
        if (fileMap.find((*it)->fdSrc) == fileMap.end()) {
            strcpy(path, "N/A");
        } else {
            strcpy(path, fileMap[(*it)->fdSrc]->path.c_str());
        }

        char hash_byte[3];
        char hash[33] = { 0 };
        for (int i = 0; i < 32; i += 2) {   //printed all hash
            snprintf(hash_byte, 3, "%02X", (*it)->hash[i]);
            hash[i] = hash_byte[0];
            hash[i + 1] = hash_byte[1];
        }

        //log_to_file(LOG_FILE_TAINTMAP, "start: %lu, size: %d, fd_src: %d, fp_src: %s, hash: %s, smallblocks: ", (*it)->start, (*it)->size, (*it)->fdSrc, path, hash);
        ret << "start: " << (*it)->start << ", size: " << (*it)->size << ", fd_src: " << (*it)->fdSrc << ", fp_src: " << path << ", hash: " << hash << ", smallblocks: \n";

        char printedSmallBlock[SMALL_BLOCK_SIZE * 3 + 5];
        vector<SmallBlock *>::iterator it3;
        for (it3 = smallBlocks.begin(); it3 != smallBlocks.end(); it3++) {
            if ((*it3)->start == (*it)->start) {
                buffer_to_string(printedSmallBlock, SMALL_BLOCK_SIZE * 3 + 5, (*it3)->block, SMALL_BLOCK_SIZE);
                //log_to_file(LOG_FILE_TAINTMAP, "%s", printedSmallBlock);
                ret << printedSmallBlock << "\n";
            }
        }
    };
    return ret.str();
}



/*
 * Prints all private files into log file
 */
void printPrivateFiles()
{
    log_to_file(LOG_FILE_TAINTMAP, "privateFiles: ");

    vector<TaintedFile>::iterator it;
    for (it = privateFiles.begin(); it < privateFiles.end(); it++) {
        log_to_file(LOG_FILE_TAINTMAP, "%s (%llu) ", it->path.c_str(), it->time);
    }
}

/*
 * Prints all tainted files into log file
 */
void printTaintedFiles()
{
    log_to_file(LOG_FILE_TAINTMAP, "taintedFiles: ");

    vector<TaintedFile>::iterator it;
    for (it = taintedFiles.begin(); it < taintedFiles.end(); it++) {
        log_to_file(LOG_FILE_TAINTMAP, "%s (%llu) ", it->path.c_str(), it->time);
    }
}



