#ifndef PE_HOOKS_H_
#define PE_HOOKS_H_

void handle_before_open ( const char *file, int flags, int mode );
void handle_after_open ( int result, const char *file, int flags, int mode );

void handle_before_close ( int fd );
void handle_after_close ( int result, int fd );

void handle_before_read ( int file, void *buffer, size_t length );
void handle_after_read ( int &result, int file, void *buffer, size_t length );

void handle_before_write ( int file, const void *buffer, size_t count );
void handle_after_write ( int result, int file, const void *buffer, size_t count );

#endif /* PE_HOOKS_H_ */
