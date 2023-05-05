#ifndef PE_TAINT_MAP_H_
#define PE_TAINT_MAP_H_

/**
 * SETTINGS FROM PE Private Files Configuration Application
 */
// 0-none, 1-use hashes, 2-use hashes and content of files
extern int SCANNING_TYPE;

// 0-none, 1-confirmation dialog, 2-application termination, 3-empty data, 4-fake data
extern int RESTRICTION_TYPE;

// 0-none, 1-communication mediation, 2-file protection, 3-both
extern int RESTRICTION_METHOD;

// 0-none, 1-empty, 2-fake
extern int THREAT_LEVEL;

// 0-turned off, 1-turned on
extern int ENABLED_LOGGING;

// if 0 content of file (small blocks) is not used, otherwise used this size for division
#define SMALL_BLOCK_SIZE 4

// if 0 hashes are not used, otherwise used only when memory block is equally sized or bigger
#define MIN_BLOCK_SIZE (SMALL_BLOCK_SIZE)

#define SIZE_OF_HASH 32

class TaintedFile
{
public:
    unsigned long long time; //for testing and further extensions with tracking all paths
    std::string path;

    static TaintedFile create ( std::string path );
    static bool isTaintedFile ( std::string path );
    static bool foundInVector ( std::string path, std::vector<TaintedFile> *vec );
    static bool hasPrivateContent ( unsigned char *hash );
};


extern unsigned long long globalTime;

extern std::vector<TaintedFile> privateFiles; // absolute paths of user-selected files, protected against removal!!!

extern std::vector<TaintedFile> taintedFiles; //absolute paths of newly tainted files

//contains part if information
class SmallBlock   //could be string, but this is more memory efficient and faster for processing
{
public:
    unsigned long start;
    char block[SMALL_BLOCK_SIZE];
};

class MemBlock   //methods move to class and rewrite to static
{
public:
    unsigned long start; /* start address */
    int size; /* size of memory block */
    int fdSrc; /* source file descriptor */
    TaintedFile fpSrc; /* full path of source file - do not have to be but verify! */
    unsigned char hash[32]; /* counted hash */
    //extern std::vector<SmallBlock *> smallBlocks; /* blocks of stored information */

    static MemBlock *add ( int result, int file, void *buffer );
    static MemBlock *isOverlapping ( unsigned long buffer, int readSize );
    static void untaint ( int fd );
    static void createSmallBlocks ( const void *buffer, int readSize, unsigned long start );
    static bool foundInSmallBlocks ( const void *buffer, int readSize, unsigned long &foundBlock );
    static bool isTaintedBlock(const void *buffer, int result, unsigned char hash[32]);
    static void cutBlock ( MemBlock *block, const void *buffer, int size );
    static void pushBlock(MemBlock *block);
    static void printAll();
    static std::string getPrint();
};

extern std::vector<MemBlock *> taintMap;

extern std::vector<SmallBlock *> smallBlocks; /* blocks of stored information */

class FileInfo
{
public:
    int mode;
    int flags;
    std::string path;

    static void add ( int fd, const char *file, int flages, int mode );
    static void printAll();
    static std::string getPrint();
};

extern std::map<int, FileInfo *> fileMap; // key is like indexted fd parameter

void printPrivateFiles();

void printTaintedFiles();

#endif /* PE_TAINT_MAP_H_ */
