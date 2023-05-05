/*
 * logfile.h
 *
 *  Created on: Sep 6, 2011
 *      Author: rubin
 */

#ifndef LOGFILE_H_
#define LOGFILE_H_

#include <android/log.h>

#ifndef LOG_TAG
#define  LOG_TAG    "apihook"
#endif

#if DISABLE_LOGGING
#define LOG_TO_CAT(...)
#define LOGEC(...)
#else
#define  LOG_TO_CAT(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGEC(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)
#endif

#if DISABLE_LOGGING
#define LOG_TO_FILE(...)
#define LOGE(...)
#elif defined(LOG_FILE)
void logi_file(const char* fname, const char * str, ...);
#define  LOG_TO_FILE(...)  logi_file(LOG_FILE, __VA_ARGS__)
#define  LOGE(...)  logi_file(LOG_FILE, __VA_ARGS__)
#else
#define  LOG_TO_FILE(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)
#endif


#define MLOG(...) __android_log_print(ANDROID_LOG_INFO,"MV",__VA_ARGS__); logi_file("/sdcard/access.txt", __VA_ARGS__)


#define LOGV(...) __android_log_print(ANDROID_LOG_VERBOSE,LOG_TAG,__VA_ARGS__)

#endif /* LOGFILE_H_ */
