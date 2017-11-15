/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   print_memory.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: exam <marvin@42.fr>                        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/14 10:58:11 by exam              #+#    #+#             */
/*   Updated: 2017/11/14 12:44:40 by exam             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>

void	ft_putchar(char c);
void	print_memory(const void *addr, size_t size);
void	ft_putval(unsigned char *s, int max);
void	ft_puthex(unsigned char c);

void	print_memory(const void *addr, size_t size)
{
	unsigned char	*s;
	unsigned char	*t;
	size_t			i;
	size_t			len;

	s = (unsigned char*)addr;
	t = s;
	i = 1;
	len = 16 * (size / 16);
	while (len)
	{
		ft_puthex(*s);
		s++;
		len--;
		if (i % 16 == 0)
		{
			ft_putchar(' ');
			ft_putval(t, -1);
			t = s;
		}
		else if (i % 2 == 0)
			ft_putchar(' ');
		i++;
	}
	if (size % 16 != 0)
	{
		i = 1;
		while(i < (size % 16) + 1)
		{
			ft_puthex(*s);
			s++;
			if (i % 2 == 0)
				ft_putchar(' ');
			i++;
		}
		len = i - 1;
		i = (i/2) * 5;
		while (i < 40)
		{
			ft_putchar(' ');
			i++;
		}
		ft_putval(t, len);
	}
}

void	ft_putval(unsigned char *s, int max)
{
	size_t 	i;
	char	c;
	size_t		size;

	size = (max == -1) ? 16 : max;
	i = 0;
	while (i < 16 && i < size)
	{
		c = *(s + i);
		if (c > ' ' && c < 127)
			ft_putchar(*(s + i));
		else
			ft_putchar('.');
		i++;
	}
	ft_putchar('\n');
}

void	ft_putchar(char c)
{
	write(1, &c, 1);
}

void	ft_puthex(unsigned char c)
{
	int h;
	int b;

	if (c == 0)
	{
		ft_putchar('0');
		ft_putchar('0');
		return ;
	}
	h = c / 16;
	b = c % 16;
	if (h > 9)
		ft_putchar(h + 'a' - 10);
	else
		ft_putchar(h + '0');
	if (b > 9)
		ft_putchar(b + 'a' - 10);
	else
		ft_putchar(b + '0');
}
