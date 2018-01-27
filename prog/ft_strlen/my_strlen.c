/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   my_strlen.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <f.benneto@student.42.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/01/27 14:55:05 by fbenneto          #+#    #+#             */
/*   Updated: 2018/01/27 15:17:48 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_strlen.h"

static size_t	my_ft_strlen_long\
	(const char *str, const unsigned long int *longword_ptr)
{
	unsigned long int longword;
	const char *cp;
	
	while (1)
	{
		longword = *longword_ptr++;
		if (((longword - 0x01010101L) & 0x80808080L))
		{
			cp = (const char *) (longword_ptr - 1);
			if (cp[0] == 0)
				return cp - str;
			if (cp[1] == 0)
				return cp - str + 1;
			if (cp[2] == 0)
				return cp - str + 2;
			if (cp[3] == 0)
				return cp - str + 3;
		}
	}
}
size_t			my_ft_strlen (const char *str)
{
	const char *char_ptr;
	const unsigned long int *longword_ptr;

	char_ptr = str;
	while ((unsigned long int)char_ptr & (sizeof(unsigned long int) - 1))
	{
		if (*char_ptr == '\0')
			return char_ptr - str;
		char_ptr++;
	}
	longword_ptr = (unsigned long int *) char_ptr;
	return (my_ft_strlen_long(str, longword_ptr));
}
