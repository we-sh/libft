#include "libft.h"

/*
** This function duplicates the value `*value` and push it at the beginning
** of the array pointed by `***array` through an allocation of a new one.
** If either parameter is NULL, it returns -1.
** If the array pointed by `***array` is NULL, a new one is created.
** On failure, the function returns -1 and `***array` is not changed.
** On success, the function returns the new size of the array.
*/

int			ft_array_push_front(char ***array, char const *value)
{
	return (ft_array_push_index(array, value, 0));
}
