#include "libft.h"

/*
** Display a char * in a file descriptor.
** @param	s		the char * to print
** @param	fd		the file descriptor
*/

void	ft_putstr_fd(const char *s, int fd)
{
	write(fd, s, ft_strlen(s));
}
