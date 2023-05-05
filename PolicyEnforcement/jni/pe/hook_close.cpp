#include <stdio.h>

#include <map>
#include <vector>
#include <string>
#include <algorithm>
#include <list>

#include "taint_map.h"
#include "logging.h"
#include "utilities.h"

using namespace std;

void handle_before_close(int fd)
{
    /*
     * Logging
     */
	log_close(0, fd);
	make_snapshot("AT START handle_before_close");

    /*
     * Prerequisities
     */
    if (SCANNING_TYPE == 0 && THREAT_LEVEL == 0) {
        return;
    }

    /*
     * Marks the Memory Block that source files is not already available
     */
    vector<MemBlock *>::iterator it;
    for (it = taintMap.begin(); it != taintMap.end(); it++) {
        if ((*it)->fdSrc == fd) {
            (*it)->fdSrc = 0;   //only marks
        }
    };

    /*
     * Erase entry from fileMap
     */
    map<int, FileInfo *>::iterator it3 = fileMap.find(fd);
    if (it3 != fileMap.end()) {
        fileMap.erase(it3->first);
    }
}

void handle_after_close(int result, int fd) {}
