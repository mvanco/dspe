#include <dlfcn.h>
#include <unistd.h>
#include <errno.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>
#include <string>
#include <string.h>
#include <libgen.h>

#include <map>
#include <algorithm>
#include <iostream>
#include <vector>
#include <list>
#include <fstream>

#include "logging.h"
#include "taint_map.h"

#define PROTECTED_FILE_SUFFIX "~pe"
#define PROTECTED_FILE_SUFFIX_LENGTH strlen(PROTECTED_FILE_SUFFIX)

using namespace std;

#define FILENAME_BUFFER_SIZE 1024
char pe_filename_buffer[FILENAME_BUFFER_SIZE] = "";
char pe_pathfile[20];

/*
 * Checks if the given string is prefix of another string
 */
bool peStartsWith(const char *prefix, const char *string)
{
    size_t prefix_len = strlen(prefix), string_len = strlen(string);
    return string_len < prefix_len ? false : strncmp(prefix, string, prefix_len) == 0;
}

/*
 * Reads file name according to file descriptor from /proc/self/fd/<fd> file
 */
int pe_get_file_name(int fd, char *filename) {
	int result=-1;
	sprintf(pe_pathfile,"/proc/self/fd/%d",fd);
	memset(pe_filename_buffer,'\0', FILENAME_BUFFER_SIZE);
	result = readlink(pe_pathfile, pe_filename_buffer, sizeof(pe_filename_buffer));
	if (result != -1) {
		log_to_file(LOG_FILE_ERROR, "filename for %d is: %s", fd, pe_filename_buffer);
		strcpy(filename, pe_filename_buffer);
	}
	else {
		log_to_file(LOG_FILE_ERROR, "Error finding filename for %d :   %s", fd, strerror(errno));
	}
	return result;
}

/*
 * Return actual time as string
 */
const char *print_time() {
	time_t t = time(NULL);
	struct tm tm = *localtime(&t);

	static char buffer[50];

	sprintf(buffer, "[%d/%d %d:%d:%d] ", tm.tm_mon + 1, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
	return buffer;
}

/*
 * Finds out if the given path is marked as tainted according to tainting structures
 */
bool isTaintedFile(string path) {
  vector<TaintedFile>::iterator i;
  for (i = privateFiles.begin(); i < privateFiles.end(); i++) {
    if (i->path == path) {
      return true;
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
 * Trim the newline character at the end of string
 */
char *remove_newline(char *s)
{
    int len = strlen(s);

    if (len > 0 && s[len-1] == '\n')  // if there's a newline
        s[len-1] = '\0';          // truncate the string

    return s;
}

/*
 * Checks if the file is regular file
 */
bool is_file(const char* path) {
    struct stat buf;
    stat(path, &buf);
    return S_ISREG(buf.st_mode);
}

/*
 * Checks if the file is directory
 */
bool is_dir(const char* path) {
    struct stat buf;
    stat(path, &buf);
    return S_ISDIR(buf.st_mode);
}

/*
 * Converts equivalent paths into standard path according to content of convert table
 */
void convertToRealPath(string &path) {
    map<string, string> table;

    //ALIASES IN ANDROID
    table["/sdcard"] = "/storage/sdcard0";

    map<string, string>::iterator it;
    for (it = table.begin(); it != table.end(); it++) {
        if (path.compare(0, it->first.length(), it->first) == 0) {
            path = it->second + path.substr(it->first.length(), path.length() - it->first.length());
            return;
        }
    };
}

/*
 * Returns the position of last dot in string
 */
int get_dot_index(const char *filename) {
    const char *dot = strrchr(filename, '.');
    if(!dot || dot == filename) return -1;
    return dot - filename;
}

/*
 * Renames file according to /path/to/.file~pe.suffix template
 */
void renameToProtected(char *dst, const char *source) {
        int it = 0; //iterator for destination string

        char *source2 = strdup(source);
        char *directory = dirname(source2);
        strcpy(dst, directory);
        it += strlen(directory);

        dst[it++] = '/';
        dst[it++] = '.';

        char *source3 = strdup(source);
        char *src = basename(source3);

        int dot_index = get_dot_index(src);
        if (dot_index != -1) {
                src[dot_index] = '\0'; //divide filename and suffix
        }

        int i = 0;
        for (i = 0; i < strlen(src); i++) {
                dst[it + i] = src[i]; //copy filename
        }

        it += i;
        strcpy(dst + it, PROTECTED_FILE_SUFFIX);
        it += PROTECTED_FILE_SUFFIX_LENGTH;

        dst[it++] = '.';

        strcpy(dst + it, src + dot_index + 1);
        it += strlen(src + dot_index + 1);

        dst[it] = '\0';
}

/*
 * Finds out if the file is twin backup file
 */
bool isProtected(const char *file) {
    char *source = strdup(file);
    char *filename = basename(source);

    int dot_index = get_dot_index(filename);
    if (dot_index != -1) {
            filename[dot_index] = '\0'; //divide filename and suffix
    }

    int length = strlen(filename);
    bool hasRightSuffix = (filename[length - 3] == '~') && (filename[length - 2] == 'p') && (filename[length - 1] == 'e');

    return (filename[0] == '.') && hasRightSuffix;

}

/*
 * Protects file using removing technique (File Protection method in configuration)
 */
void protectFilePE(const char *file) { //is working with regular file without ~pe suffix
        if ( isProtected(file) ) { //already protected
                return; //this file cant be protected
        }

        char newFile[strlen(file) + 4];
        memset(newFile, 0, strlen(file) + 4);
        renameToProtected(newFile, file);

        FILE *protectedFile = fopen(newFile,"r");
        if( !protectedFile ) { //has already protected twin; only once, if it is protected nothing is done
                rename(file, newFile); //creates twin
                ofstream emptyFile(file); //creates empty fake file
                emptyFile.close();
        }
}

/*
 * Unprotect file using removing technique (File Protection method in configuration)
 */
void unprotectFilePE(const char *file) { //is working with regular file without ~pe suffix
        if ( isProtected(file) ) { //already protected
                return; //this file cant be protected
        }

        char newFile[strlen(file) + 4];
        memset(newFile, 0, strlen(file) + 4);
        renameToProtected(newFile, file);

        FILE *protectedFile = fopen(newFile,"r");
        if( protectedFile ) { //has already protected twin; only once, if it is protected nothing is done
                remove(file); //removes empty fake file
                rename(newFile, file); //creates twin
        }

}


