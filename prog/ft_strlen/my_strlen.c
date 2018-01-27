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

size_t	my_ft_strlen (const char *str)
{
	const char *char_ptr;
	const unsigned long int *longword_ptr;
	unsigned long int longword;

	// for (char_ptr = str; ((unsigned long int) char_ptr & (sizeof (longword) - 1)) != 0; ++char_ptr)
	// 	if (*char_ptr == '\0')
	// 		return char_ptr - str;
	char_ptr = str;
	while ((unsigned long int) char_ptr & (sizeof (longword) - 1))
	{
		if (*char_ptr == '\0')
			return char_ptr - str;
		char_ptr++;
	}
	longword_ptr = (unsigned long int *) char_ptr;
	while (1)
	{
		longword = *longword_ptr++;
		if (((longword - 0x01010101L) & 0x80808080L) != 0)
		{
			const char *cp = (const char *) (longword_ptr - 1);

			if (cp[0] == 0)
				return cp - str;
			if (cp[1] == 0)
				return cp - str + 1;
			if (cp[2] == 0)
				return cp - str + 2;
			if (cp[3] == 0)
				return cp - str + 3;
			if (cp[4] == 0)
				return cp - str + 4;
			if (cp[5] == 0)
				return cp - str + 5;
			if (cp[6] == 0)
				return cp - str + 6;
			if (cp[7] == 0)
				return cp - str + 7;
		}
	}
}
