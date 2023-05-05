#include <stdio.h>
#include <fcntl.h>
#include <string.h>

#include <map>
#include <vector>
#include <string>
#include <algorithm>
#include <list>

#include "taint_map.h"
#include "logging.h"
#include "utilities.h"
#include "sha256.h"

using namespace std;

void handle_before_write(int file, const void *buffer, size_t count) {}

void handle_after_write(int result, int file, const void *buffer, size_t count)
{
    /*
     * Logging
     */
	log_write(result, file, buffer, count);
	make_snapshot("AT START handle_after_write");

    /*
     * Prerequisities
     */
    if (fileMap.find(file) == fileMap.end() || (SCANNING_TYPE == 0 && THREAT_LEVEL == 0)) {
        return;
    }
    
    /*
     * Local Variables
     */
    unsigned char hash[32]; //counted hash for read block
    
    /*
     * Counting Hash
     */
    SHA256_CTX ctx;
    sha256_init(&ctx);
    sha256_update(&ctx, (unsigned char *) buffer, result);
    sha256_final(&ctx, hash);
    
    /*
     * Marking new tainting file due to written tainted block
     */
    if (MemBlock::isTaintedBlock(buffer, result, hash)) {
        if (!TaintedFile::foundInVector(fileMap[file]->path, &taintedFiles)) {
            taintedFiles.push_back(TaintedFile::create(fileMap[file]->path));
        }
    }
    
    /*
     * Possible removing tainting file when writing untainted
     */
    else {
        int oflag = fileMap[file]->flags;
        int oflag2 = oflag | O_APPEND;
        bool inAppendMode = oflag > oflag2;
        if (TaintedFile::isTaintedFile(fileMap[file]->path) && !inAppendMode) {
            MemBlock::untaint(file);
        }
    }
}
