#include "libasm.h"
#include <stdio.h>
#include <errno.h>

int main()
{
	int	a = write(1, "Salut\n", 6);
	printf("return value: %d errno: %d\n", a, errno);
	a = ft_write(1, "Salut\n", 6);
	printf("return value: %d errno: %d\n", a, errno);

	a = write(42, "Salut\n", 6);
	printf("return value: %d errno: %d\n", a, errno);
	a = ft_write(42, "Salut\n", 6);
	printf("return value: %d errno: %d\n", a, errno);
}