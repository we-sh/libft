#include "libft.h"

/*
** This function duplicates the value `*value` and push it at the beginning
** of the array pointed by `***array` through an allocation of a new one.
** If the array is NULL, a new one is created.
** On failure, the function returns -1 and `***array` is not changed.
** On success, the function returns the new size of the array.
*/

static int	s_return_and_free(char **new_array, size_t total)
{
	while (total > 0)
	{
		total--;
		ft_memdel((void **)&new_array[total]);
	}
	free(new_array);
	return (-1);
}

int			ft_array_push_front(char ***array, char const *value)
{
	char	**new_array;
	size_t	total;

	if (!value || !array)
		return (-1);
	total = 0;
	if (*array)
		while ((*array)[total])
			total++;
	if ((new_array = (char **)malloc(sizeof(char *) * (total + 2))) == NULL)
		return (s_return_and_free(new_array, 0));
	if ((new_array[0] = ft_strdup(value)) == NULL)
		return (s_return_and_free(new_array, 0));
	total = 0;
	if (*array)
		while ((*array)[total])
		{
			if ((new_array[total + 1] = ft_strdup((*array)[total])) == NULL)
				return (s_return_and_free(new_array, total));
			total++;
		}
	new_array[++total] = NULL;
	ft_memdel_tab((void ***)&(*array));
	*array = new_array;
	return (total);
}
