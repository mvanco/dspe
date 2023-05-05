#include <string>
#include <vector>
#include <map>

#include <stdio.h>
#include <errno.h>

#include "logging.h"
#include "taint_map.h"
#include "utilities.h"

using namespace std;

#define CONF_FILE "/data/data/cz.vutbr.xvanco02.peprivatefiles/files/pe_private_files.conf"

/*
 * Remove log files before (used for optimization during application startup)
 */
void remove_log_files() {
	FILE* flog = fopen(LOG_FILE, "w");
	fclose(flog);
	flog = fopen(LOG_FILE_DEBUG, "w");
	fclose(flog);
	flog = fopen(LOG_FILE_TAINTMAP, "w");
	fclose(flog);
}

/*
 * Loads new settings from configuration file (after application startup or when ContentProvider query() message intercepted)
 */
void load_settings() {
	FILE* fr = fopen(CONF_FILE, "r");

	if (fr == NULL) {
		log_to_file(LOG_FILE_DEBUG, "ok, this will be pie");
		return; //leave default values
	}

	char line[1024];
	char str_read[256];

	fgets(line, 1024, fr);
	log_to_file(LOG_FILE_DEBUG, "first line: %s", line);
	int scanningType = 0;
	int restrictionType = 0;
	int restrictionMethod = 0;
	int threatLevel = 0;
	int logging = 0;
	int ret = sscanf(line, "%d %d %d %d %d", &scanningType, &restrictionType, &restrictionMethod, &threatLevel, &logging);
	if (ret != 5) {
		return;
	}
	//if (errno != 0) {
	//	log_to_file(LOG_FILE_DEBUG, "fucking problem: %s", strerror(errno));
	//}

	SCANNING_TYPE = scanningType;
	RESTRICTION_TYPE = restrictionType;
	RESTRICTION_METHOD = restrictionMethod;
	THREAT_LEVEL = threatLevel;
	ENABLED_LOGGING = logging;

	privateFiles.clear();
    while (fgets(line, sizeof(line), fr)) {
    	string path = string(remove_newline(line));
    	convertToRealPath(path);
    	privateFiles.push_back( TaintedFile::create(path) );
    }

    fclose(fr);
}

/*
 * Initialization function - removes log files and loads configuration
 */
void pe_init() {
	remove_log_files();
	load_settings();
}
