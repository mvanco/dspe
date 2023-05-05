#include <stdio.h>

#include <map>
#include <vector>
#include <string>
#include <list>

#include "taint_map.h"
#include "logging.h"
#include "utilities.h"

using namespace std;

void handle_before_open(const char *file, int flags, int mode) {}

void handle_after_open(int result, const char *file, int flags, int mode)
{
    /*
     * Logging
     */
	log_open(result, file, flags, mode);
	make_snapshot("AT START handle_after_open");

    /*
     * Prerequisities
     */
    if (SCANNING_TYPE == 0 && THREAT_LEVEL == 0) {
        return;
    }

    /*
     * Converting Path
     */
    string path = file;
    convertToRealPath(path);

    /*
     * Adding to fileMap vector
     */
    FileInfo::add(result, path.c_str(), flags, mode);
}
