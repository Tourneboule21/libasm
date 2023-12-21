#include "libasm.h"
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>

int main()
{
	// printf("\033[0m\033[32mwrite:\033[0m\033[37m\n");
	// int	a = write(1, "Salut\n", 6);
	// printf("return value: %d errno: %d\n\n\033[0m\033[32mft_write:\033[0m\033[37m\n", a, errno);
	// errno = 0;
	// a = ft_write(1, "Salut\n", 6);
	// printf("return value: %d errno: %d\n\n\033[0m\033[32mwrite:\033[0m\033[37m\n", a, errno);
	// errno = 0;

	// a = write(42, "Salut\n", 6);
	// printf("return value: %d errno: %d\n\n\033[0m\033[32mft_write:\033[0m\033[37m\n", a, errno);
	// errno = 0;
	// a = ft_write(42, "Salut\n", 6);
	// printf("return value: %d errno: %d\n\n\033[0m\033[32mread:\033[0m\033[37m\n", a, errno);
	// errno = 0;

	// char	buffer[16] = {0};

	// int	fd = open("Makefile", O_RDONLY);

	// a = read(fd, buffer, 15);
	// printf("buffer read: %s return value: %d errno: %d\n\n\033[0m\033[32mft_read:\033[0m\033[37m\n", buffer, a, errno);
	// errno = 0;
	// memset(buffer, 0, 16);

	// close(fd);
	// fd = open("Makefile", O_RDONLY);

	// a = ft_read(fd, buffer, 15);
	// printf("buffer read: %s return value: %d errno: %d\n\n\033[0m\033[32mread:\033[0m\033[37m\n", buffer, a, errno);
	// errno = 0;
	// memset(buffer, 0, 16);

	// a = ft_read(42, buffer, 15);
	// printf("buffer read: %s return value: %d errno: %d\n\n\033[0m\033[32mread:\033[0m\033[37m\n", buffer, a, errno);
	// errno = 0;
	// memset(buffer, 0, 16);
	// a = read(42, buffer, 15);
	// printf("buffer read: %s return value: %d errno: %d\n\n\033[0m\033[32mft_read:\033[0m\033[37m\n", buffer, a, errno);
	// errno = 0;
	// memset(buffer, 0, 16);

	// a = read(0, buffer, 15);
	// printf("buffer read: %s return value: %d errno: %d\n\n\033[0m\033[32mft_read:\033[0m\033[37m\n", buffer, a, errno);
	// errno = 0;
	// memset(buffer, 0, 16);
	// a = ft_read(0, buffer, 15);
	// printf("buffer read: %s return value: %d errno: %d\n\n\033[0m\033[32mstrlen:\033[0m\033[37m\n", buffer, a, errno);
	// errno = 0;
	// memset(buffer, 0, 16);

	// close(fd);

	// printf("empty string return value: %ld\n\n\033[0m\033[32mft_strlen:\033[0m\033[37m\n", strlen(""));
	// printf("empty string return value: %ld\n\n\033[0m\033[32mstrlen:\033[0m\033[37m\n", ft_strlen(""));

	// printf("string: Salut return value: %ld\n\n\033[0m\033[32mft_strlen:\033[0m\033[37m\n", strlen("Salut"));
	// printf("string: Salut return value: %ld\n\n\033[0m\033[32mstrcpy:\033[0m\033[37m\n", ft_strlen("Salut"));

	// char	ret1[15] = "Salut";
	// char	ret2[15] = "Salut";

	// printf("before copy(address: %p, string: %s)\n", ret1, ret1);
	// strcpy(ret1, "Hi");
	// printf("after copy(address: %p, string: %s)\n\n\033[0m\033[32mft_strcpy:\033[0m\033[37m\n", ret1, ret1);

	// printf("before copy(address: %p, string: %s)\n", ret2, ret2);
	// ft_strcpy(ret2, "Hi");
	// printf("after copy(address: %p, string: %s)\n\n\033[0m\033[32mstrcmp:\033[0m\033[37m\n", ret2, ret2);

	// printf("s1: \"dsdsf\", s2: \"\" res: %d\n\n\033[0m\033[32mft_strcmp:\033[0m\033[37m\n", strcmp("dsdsf", ""));

	// printf("s1: \"dsdsf\", s2: \"\" res: %d\n\n\033[0m\033[32mstrcmp:\033[0m\033[37m\n", ft_strcmp("dsdsf", ""));

	// printf("s1: \"\", s2: \"dsdsf\" res: %d\n\n\033[0m\033[32mft_strcmp:\033[0m\033[37m\n", strcmp("", "dsdsf"));

	// printf("s1: \"\", s2: \"dsdsf\" res: %d\n\n\033[0m\033[32mstrcmp:\033[0m\033[37m\n", ft_strcmp("", "dsdsf"));

	// printf("s1: \"dsdsf\", s2: \"ds\" res: %d\n\n\033[0m\033[32mft_strcmp:\033[0m\033[37m\n", strcmp("dsdsf", "ds"));

	// printf("s1: \"dsdsf\", s2: \"ds\" res: %d\n\n\033[0m\033[32mstrcmp:\033[0m\033[37m\n", ft_strcmp("dsdsf", "ds"));

	// printf("s1: \"ds\", s2: \"dsdsf\" res: %d\n\n\033[0m\033[32mft_strcmp:\033[0m\033[37m\n", strcmp("ds", "dsdsf"));

	// printf("s1: \"ds\", s2: \"dsdsf\" res: %d\n\n\033[0m\033[32mstrcmp:\033[0m\033[37m\n", ft_strcmp("ds", "dsdsf"));

	// printf("s1: \"dsdsf\", s2: \"abcdefghi\" res: %d\n\n\033[0m\033[32mft_strcmp:\033[0m\033[37m\n", strcmp("dsdsf", "abcdefghi"));

	// printf("s1: \"dsdsf\", s2: \"abcdefghi\" res: %d\n\n\033[0m\033[32mstrcmp:\033[0m\033[37m\n", ft_strcmp("dsdsf", "abcdefghi"));

	// printf("s1: \"abcdefghi\", s2: \"dsdsf\" res: %d\n\n\033[0m\033[32mft_strcmp:\033[0m\033[37m\n", strcmp("abcdefghi", "dsdsf"));

	// printf("s1: \"abcdefghi\", s2: \"dsdsf\" res: %d\n\n\033[0m\033[32mstrcmp:\033[0m\033[37m\n", ft_strcmp("abcdefghi", "dsdsf"));

	// printf("s1: \"\", s2: \"\" res: %d\n\n\033[0m\033[32mft_strcmp:\033[0m\033[37m\n", strcmp("", ""));

	// printf("s1: \"\", s2: \"\" res: %d\n\n\033[0m\033[32mstrcmp:\033[0m\033[37m\n", ft_strcmp("", ""));

	// printf("s1: \"abcdefghi\", s2: \"abcdefghi\" res: %d\n\n\033[0m\033[32mft_strcmp:\033[0m\033[37m\n", strcmp("abcdefghi", "abcdefghi"));

	// printf("s1: \"dsdsf\", s2: \"abcdefghi\" res: %d\n\n\033[0m\033[32mstrdup:\033[0m\033[37m\n", ft_strcmp("abcdefghi", "abcdefghi"));

	// char	*str = NULL;

	// printf("before dup(address: %p)\n", str);
	// str = strdup("Salut");
	// printf("after dup(address: %p, value: %s)\n\n\033[0m\033[32mft_strdup:\033[0m\033[37m\n", str, str);
	// free(str);
	// str = NULL;

	// printf("before dup(address: %p)\n", str);
	// str = ft_strdup("Salut");
	// printf("after dup(address: %p, value: %s)\n\n\033[0m\033[32mstrdup:\033[0m\033[37m\n", str, str);
	// free(str);
	// str = NULL;

	// printf("before dup(address: %p)\n", str);
	// str = strdup("");
	// printf("after dup(address: %p, value: %s)\n\n\033[0m\033[32mft_strdup:\033[0m\033[37m\n", str, str);
	// free(str);
	// str = NULL;

	// printf("before dup(address: %p)\n", str);
	// str = ft_strdup("");
	// printf("after dup(address: %p, value: %s)\n", str, str);
	// free(str);

	char	value[40] = "    ---++-++-+-hello";

	printf("%d\n", ft_atoi_base(value, "ab"));

	return 0;
}