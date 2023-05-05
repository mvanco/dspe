#ifndef PE_UTILITIES_H_
#define PE_UTILITIES_H_

bool peStartsWith(const char *prefix, const char *string);

int pe_get_file_name(int fd, char *filename);

const char *print_time();

bool isTaintedFile(std::string path);

char *remove_newline(char *s);

bool is_file(const char* path);

bool is_dir(const char* path);

void convertToRealPath( std::string &path );

void protectFilePE(const char *file);

void unprotectFilePE(const char *file);

#endif /* PE_UTILITIES_H_ */
