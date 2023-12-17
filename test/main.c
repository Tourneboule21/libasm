#include "libasm.h"
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>

int main()
{
	printf("write:\n");
	int	a = write(1, "Salut\n", 6);
	printf("return value: %d errno: %d\n\nft_write:\n", a, errno);
	a = ft_write(1, "Salut\n", 6);
	printf("return value: %d errno: %d\n\nwrite:\n", a, errno);

	a = write(42, "Salut\n", 6);
	printf("return value: %d errno: %d\n\nft_write:\n", a, errno);
	a = ft_write(42, "Salut\n", 6);
	printf("return value: %d errno: %d\n\nread:\n", a, errno);

	char	buffer[16];

	int	fd = open("Makefile", O_RDONLY);

	a = read(fd, buffer, 15);
	printf("buffer read: %s return value: %d errno: %d\n\nft_read:\n", buffer, a, errno);
	memset(buffer, 0, 16);

	close(fd);
	fd = open("Makefile", O_RDONLY);

	a = ft_read(fd, buffer, 15);
	printf("buffer read: %s return value: %d errno: %d\n\nread:\n", buffer, a, errno);
	memset(buffer, 0, 16);

	a = read(42, buffer, 15);
	printf("buffer read: %s return value: %d errno: %d\n\nft_read:\n", buffer, a, errno);
	memset(buffer, 0, 16);
	a = ft_read(42, buffer, 15);
	printf("buffer read: %s return value: %d errno: %d\n\nread:\n", buffer, a, errno);
	memset(buffer, 0, 16);

	a = read(0, buffer, 15);
	printf("buffer read: %s return value: %d errno: %d\n\nft_read:\n", buffer, a, errno);
	memset(buffer, 0, 16);
	a = ft_read(0, buffer, 15);
	printf("buffer read: %s return value: %d errno: %d\n", buffer, a, errno);
	memset(buffer, 0, 16);

	close(fd);
	return 0;
}