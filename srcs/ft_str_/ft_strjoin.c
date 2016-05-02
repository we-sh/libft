/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strjoin.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anouvel <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/06 14:40:15 by anouvel           #+#    #+#             */
/*   Updated: 2016/05/02 13:45:12 by anouvel          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strjoin(char const *s1, char const *s2)
{
	char	*str;
	int		i;
	int		i1;
	int		i2;

	i = -1;
	i1 = -1;
	i2 = -1;
	if (s1 && s2)
	{
		if (!(str = ft_strnew(ft_strlen(s1) + ft_strlen(s2))))
			return (NULL);
		else
		{
			while (s1[++i1] != '\0')
				str[++i] = s1[i1];
			while (s2[++i2] != '\0')
				str[++i] = s2[i2];
			str[++i] = '\0';
		}
		return (str);
	}
	return (NULL);
}
