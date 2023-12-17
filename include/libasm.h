#ifndef	_LIBASM_H_
#define	_LIBASM_H_

#include <unistd.h>

ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, void *buf, size_t count);
size_t	ft_strlen(const char *s);

#endif