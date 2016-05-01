/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcmp.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: anouvel <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/03 18:28:36 by anouvel           #+#    #+#             */
/*   Updated: 2014/11/10 16:40:18 by anouvel          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int		ft_strcmp(const char *s1, const char *s2)
{
	int i;
	int cmp;

	cmp = 0;
	if (s1 && s2)
	{
		i = 0;
		while ((s1[i] != '\0' || s2[i] != '\0') && cmp == 0)
		{
			cmp = (unsigned char)(s1[i]) - (unsigned char)(s2[i]);
			i++;
		}
	}
	return (cmp);
}
