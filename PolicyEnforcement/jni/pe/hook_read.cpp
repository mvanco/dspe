#include <stdio.h>
#include <string.h>
#include <sys/stat.h>

#include <map>
#include <vector>
#include <string>
#include <algorithm>
#include <list>
#include <sstream>

#include "taint_map.h"
#include "logging.h"
#include "utilities.h"
#include "sha256.h"

using namespace std;

void handle_before_read(int file, void *buffer, size_t length) {}

void handle_after_read(int &result, int file, void *buffer, size_t length)
{
    /*
     * Logging
     */
	log_read(result, file, buffer, length);
	make_snapshot("AT START handle_after_read");

    /*
     * Prerequisities
     */
    if (fileMap.find(file) == fileMap.end() || (SCANNING_TYPE == 0 && THREAT_LEVEL == 0)) {
        return;
    }

    /*
     * Ensure if Unprotected
     */
    if (RESTRICTION_METHOD == 2 || RESTRICTION_METHOD == 3) {
    	unprotectFilePE(fileMap[file]->path.c_str());
    }

    /*
     * Local Variables
     */
    unsigned char hash[32]; //counted hash for read block
    unsigned long foundBlock = -1; //id (start address) of found block using content-based scanning

    /*
     * Counting Hash
     */
    SHA256_CTX ctx;
    sha256_init(&ctx);
    sha256_update(&ctx, (unsigned char *) buffer, result);
    sha256_final(&ctx, hash);

    //MemBlock *memBlock;
    //while ( (memBlock = MemBlock::isOverlapping(buffer, result)) != NULL ) {
    //  MemBlock::cutBlock(memBlock, buffer, result);
    //}

    /*
    * Not tainted but should be tainted according to content?
    */
    if (!TaintedFile::isTaintedFile(fileMap[file]->path)) {
        if ( TaintedFile::hasPrivateContent(hash)
        || ((SCANNING_TYPE == 2) && MemBlock::foundInSmallBlocks(buffer, result, foundBlock)) ) {
            if (!TaintedFile::foundInVector(fileMap[file]->path, &taintedFiles)) {
                taintedFiles.push_back(TaintedFile::create(fileMap[file]->path));
            }
        }
    }


    /*
     * Marking the tainted file as tainted Memory Block
     * */
    if (TaintedFile::isTaintedFile(fileMap[file]->path)) {      //reading tainted file

        /*
         * Dealing with increased threat THREAT_LEVEL
         */
        if (THREAT_LEVEL == 2) {
            int fake_i = -1;
            char fake_string[] = "fake ";
            char *writter = (char *) buffer;
            for (int i = 0; i < result; i++) {
                writter[i] = fake_string[++fake_i % 5];
            }

            //TODO: make better
            //chmod(fileMap[file]->path.c_str(), 0);
            //protectFilePE(fileMap[file]->path.c_str());


            return;
        } else if (THREAT_LEVEL == 1) {
            result = 0;
            return;
        }

        if (result >= MIN_BLOCK_SIZE) {
			MemBlock *block = new MemBlock;
			block->start = (unsigned long) buffer;
			block->size = result;
			block->fdSrc = file;
			block->fpSrc = TaintedFile::create(fileMap[file]->path);
			strncpy((char *) block->hash, (char *) hash, SIZE_OF_HASH);
			MemBlock::createSmallBlocks(buffer, result, (unsigned long) buffer);

			MemBlock::pushBlock(block);
        }
    }
}
