#include "libft.h"

char	*ft_strcat(char *s1, const char *s2)
{
	int i1;
	int i2;

	i1 = 0;
	i2 = 0;
	if (s1 && s2)
	{
		while (s1[i1] != '\0')
			i1++;
		while (s2[i2] != '\0')
		{
			s1[i1] = s2[i2];
			i1++;
			i2++;
		}
		s1[i1] = '\0';
	}
	return (s1);
}
