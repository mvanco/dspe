#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <string>
#include <sstream>
#include <cstring>
#include <vector>
#include <map>
#include <list>

#include "logging.h"
#include "utilities.h"
#include "taint_map.h"
#include "init.h"

using namespace std;

#define LOG_FILE "/sdcard/pe_log.txt"
#define LOG_FILE_DEBUG "/sdcard/pe_log_debug.txt"
#define LOG_FILE_ERROR "/sdcard/pe_log_error.txt"
#define LOG_FILE_TAINTMAP "/sdcard/pe_log_taintmap.txt"
#define LOG_FILE_FUNC "/sdcard/pe_log_func.txt"

#define LOG_TAG "pe"
#define LOG_TAG_DEBUG "pe_debug"

#define START_FILE_MARKER "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n"
#define END_FILE_MARKER ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n"

#include "logfile.h"

static bool first_run = true;
static int counter = 0;

#define BUF_SIZE 2048
char buf[BUF_SIZE];

#define BUF_CONT_SIZE 3 * 448000
char buf_cont[BUF_CONT_SIZE];

/* CONFIGURATION OF LOGGING */
const bool SHOW_FILE_CONTENT = true;

/* END CONFIGURATION OF LOGGING */

/*
 * Standard function for logging without time record
 */
void write_to_file(const char* fname, const char * str, ...) {

	/* PREREQUISITE */
	if (!ENABLED_LOGGING) {
		return; //optimalization
	}

	FILE* flog = fopen(fname, "a");

    va_list argptr;
    va_start(argptr, str);
    vfprintf(flog, str, (__va_list) argptr);
    va_end(argptr);

	fclose(flog);
}

/*
 * Standard function for logging with time record
 */
void log_to_file(const char* fname, const char * str, ...)
{
	/* PREREQUISITE */
	if (!ENABLED_LOGGING) {
		return;
	}

	FILE* flog = fopen(fname, "a");

	fprintf(flog, "%s", print_time());

    va_list argptr;
    va_start(argptr, str);
    vfprintf(flog, str, (va_list) argptr);
    va_end(argptr);

    fprintf(flog, "\n");

    fflush(flog);

	fclose(flog);
}

/*
 * Function for treated logging from char buffer
 */
void log_buffer(const void *buffer, size_t length) {

	/* PREREQUISITE */
	if (!ENABLED_LOGGING) {
		return; //optimalization
	}

	if (!SHOW_FILE_CONTENT) {
		return;
	}

	write_to_file(LOG_FILE, "%s", START_FILE_MARKER);

	FILE* flog = fopen(LOG_FILE, "a");
	for (int i = 0; i < length; i++) {

		char c = *((char *) buffer + i);
		int c_int = (int) c;

		if (c_int >= 65 && c_int <= 122) {
			fprintf(flog, "%c", c);
		}
		else {
			fprintf(flog, ".%d", c_int);
		}
	}
	fclose(flog);

	write_to_file(LOG_FILE, "\n%s", END_FILE_MARKER);
}

/*
 * Conversion function for converting data to treated string with char codes
 */
void buffer_to_string(char *dst, int dst_size, const void *buffer, int length) {
	string str = "";
	for (int i = 0; i < length; i++) {

		const char c = *((const char *) buffer + i);
		int ord = (int) c;
		char c_int[10];
		sprintf(c_int, "%02X", (int) c);

		if (ord >= 32 && ord <= 126) {
			str += "'";
			str += c;
			str += " ";
		}
		else {
			str += "`";
			str += c_int;
		}
	}

	if (str.length() > (dst_size - 3)) {
		string str2 = str.substr(0, dst_size - 3);
		str2 += "\0";
		strncpy(dst, str2.c_str(), dst_size);
	}
	else {
		str += "\0";
		strncpy(dst, str.c_str(), dst_size);
	}
}

/*
 * Pre-prepared function for logging open() event
 */
void log_open(int result, const char *file, int flags, int mode) {

	/* INITIALIZATIONS */
	if (first_run) {
		first_run = false;
		pe_init();
	}

	/* PREREQUISITE */
	if (!ENABLED_LOGGING) {
		return; //optimalization
	}

	log_to_file(LOG_FILE_FUNC, "open(%d, %s, %d, %d)", result, file, flags, mode);
	log_to_file(LOG_FILE, "open: %s, fd: %d, flags: %d, mode %d\n", file, result, flags, mode);
}

/*
 * Pre-prepared function for logging close() event
 */
void log_close(int result, int fd) {

	/* PREREQUISITE */
	if (!ENABLED_LOGGING) {
		return; //optimalization
	}

	log_to_file(LOG_FILE_FUNC, "close(%d, %d)", result, fd);

	string filename = "";
	if (fileMap.find(fd) == fileMap.end()) {
		filename = "N/A";
	}
	else {
		filename = fileMap[fd]->path;
	}

	log_to_file(LOG_FILE, "close: %s, fd: %d, result: %d\n", filename.c_str(), fd, result);
}

/*
 * Pre-prepared function for logging read() event
 */
void log_read(int result, int file, void *buffer, size_t length) {

	/* PREREQUISITE */
	if (!ENABLED_LOGGING) {
		return; //optimalization
	}

	string filename = "";
	if (fileMap.find(file) == fileMap.end()) {
		filename = "N/A";
	}
	else {
		filename = fileMap[file]->path;
	}

	snprintf(buf, BUF_SIZE, "read: %s, fd: %d, count: %d/%d, block: %u-%u\n", filename.c_str(), file, result, length, (unsigned int) buffer, ((unsigned int) buffer) + result);
	buffer_to_string(buf_cont, BUF_CONT_SIZE, buffer, result);

	log_to_file(LOG_FILE, "%s%s%s\n%s", buf, START_FILE_MARKER, buf_cont, END_FILE_MARKER);

	log_to_file(LOG_FILE_FUNC, "read(%d, %d, <bellow>, %d)\n%s", result, file, length, buf_cont);
}

/*
 * Pre-prepared function for logging write() event
 */
void log_write(int result, int file, const void *buffer, size_t count) {

	/* PREREQUISITE */
	if (!ENABLED_LOGGING) {
		return; //optimalization
	}

	string filename = "";
	if (fileMap.find(file) == fileMap.end()) {
		filename = "N/A";
	}
	else {
		filename = fileMap[file]->path;
	}

	snprintf(buf, BUF_SIZE, "write: %s, fd: %d, count: %d/%d, block: %u-%u\n", filename.c_str(), file, result, count, (unsigned int) buffer, ((unsigned int) buffer) + result);
	buffer_to_string(buf_cont, BUF_CONT_SIZE, buffer, result);

	log_to_file(LOG_FILE, "%s%s%s\n%s", buf, START_FILE_MARKER, buf_cont, END_FILE_MARKER);

	log_to_file(LOG_FILE_FUNC, "write(%d, %d, <bellow>, %d)\n%s", result, file, count, buf_cont);
}

/*
 * Logging to debug file
 */
void log_debug(const char *str, ...) {

	/* PREREQUISITE */
	if (!ENABLED_LOGGING) {
		return; //optimalization
	}

	FILE* flog = fopen(LOG_FILE_DEBUG, "a");

	fprintf(flog, "%s", print_time());

	va_list argptr;
	va_start(argptr, str); //Requires the last fixed parameter (to get the address)
	vfprintf(flog, str, (__va_list)argptr);
	va_end(argptr);

	fprintf(flog, "\n");

	fclose(flog);
}

/*
 * Creates snapshot of tainting structures
 */
void make_snapshot(string text) {

	/* PREREQUISITE */
	if (!ENABLED_LOGGING) {
		return; //optimalization
	}

	string buf = "";
	buf += "*** SNAPSHOT (";
	buf += text;
	buf += ") ***\n";

	buf += "Private Files: \n";
	vector<TaintedFile>::iterator it;
	std::ostringstream buf2;
	for (it = privateFiles.begin(); it < privateFiles.end(); it++) {
		buf2 << it->path.c_str() << "(" << it->time << ")" << "\n";
	}
	buf += buf2.str();


	buf += "\nTainted Files: \n";
	std::ostringstream buf3;
	for (it = taintedFiles.begin(); it < taintedFiles.end(); it++) {
		buf3 << it->path.c_str() << "(" << it->time << ")" << "\n";
	}
	buf += buf3.str();


	buf += "\nFileInfo::printAll(): \n";
	buf += FileInfo::getPrint();
	buf += "\nMemBlock::printAll(): \n";
	buf += MemBlock::getPrint();
	buf += "***********************************\n\n\n";

	log_to_file(LOG_FILE_TAINTMAP, buf.c_str());
}
