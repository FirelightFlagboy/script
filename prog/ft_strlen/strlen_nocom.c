/* Copyright (C) 1991, 1993, 1997, 2000, 2003 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   Written by Torbjorn Granlund (tege@sics.se),
   with help from Dan Sahlin (dan@sics.se);
   commentary by Jim Blandy (jimb@ai.mit.edu).

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#include <string.h>
#include <stdlib.h>

size_t ft_strlen2 (const char *str)
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
	if (sizeof (longword) > 4)
	{
		magic_bits = ((0x7efefefeL << 16) << 16) | 0xfefefeffL;
		himagic = ((0x80808080L << 16) << 16) | 0x80808080L;
		lomagic = ((0x01010101L << 16) << 16) | 0x01010101L;
	}
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
			if (sizeof (longword) > 4)
			{
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
}
