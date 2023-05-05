#ifndef PE_LOGGING_H_
#define PE_LOGGING_H_

#define LOG_FILE "/sdcard/pe_log.txt"
#define LOG_FILE_DEBUG "/sdcard/pe_log_debug.txt"
#define LOG_FILE_ERROR "/sdcard/pe_log_error.txt"
#define LOG_FILE_TAINTMAP "/sdcard/pe_log_taintmap.txt"

void log_to_file(const char *fname, const char *str, ...);

void buffer_to_string(char *dst, int dst_size, const void *buffer, int length);

void log_open(int result, const char *file, int flags, int mode);

void log_close(int result, int fd);

void log_read(int result, int file, void *buffer, size_t length);

void log_write(int result, int file, const void *buffer, size_t count);

void log_debug(const char *str, ...);

void make_snapshot(std::string text);

#endif /* PE_LOGGING_H_ */
