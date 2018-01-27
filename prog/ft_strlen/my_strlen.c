/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   my_strlen.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <f.benneto@student.42.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/01/27 14:55:05 by fbenneto          #+#    #+#             */
/*   Updated: 2018/01/27 14:58:18 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_strlen.h"

size_t	my_ft_strlen (const char *str)
{
	const char *char_ptr;
	const unsigned long int *longword_ptr;
	unsigned long int longword, magic_bits, himagic, lomagic;

	for (char_ptr = str; ((unsigned long int) char_ptr & (sizeof (longword) - 1)) != 0; ++char_ptr)
		if (*char_ptr == '\0')
			return char_ptr - str;
	longword_ptr = (unsigned long int *) char_ptr;
	magic_bits = 0x7efefeffL;
	himagic = 0x80808080L;
	lomagic = 0x01010101L;
	printf ("%ld %ld %ld\n", magic_bits, himagic, lomagic);	
	if (sizeof (longword) > 4)
	{
		magic_bits = ((magic_bits << 16) << 16) | magic_bits;
		himagic = ((himagic << 16) << 16) | himagic;
		lomagic = ((lomagic << 16) << 16) | lomagic;
	}
	printf ("%ld %ld %ld\n", magic_bits, himagic, lomagic);
	while (1)
	{
		longword = *longword_ptr++;
		if (((longword - lomagic) & himagic) != 0)
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
