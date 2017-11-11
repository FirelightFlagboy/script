/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   fprime.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/11 11:26:27 by fbenneto          #+#    #+#             */
/*   Updated: 2017/11/11 12:44:22 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int		ft_next_prime(int n);
int		ft_sqrt(int n);
void	ft_putnbr(int nb);
void	ft_putchar(char c);
void	fprime(int nb);
void	ft_prime(int nb);
void	ft_putstr(char *str);
size_t	ft_strlen(char *str);

int main(void)
{
	int nb = 123456789;
	int nb1 = 1;
	int nb2 = 190;
	int nb3 = 117;
	int nb4 = 3803;

	ft_putnbr(nb);
	ft_putstr(" : ");
	fprime(nb);
	ft_putchar('\n');

	ft_putnbr(nb1);
	ft_putstr(" : ");
	fprime(nb1);
	ft_putchar('\n');

	ft_putnbr(nb2);
	ft_putstr(" : ");
	fprime(nb2);
	ft_putchar('\n');

	ft_putnbr(nb3);
	ft_putstr(" : ");
	fprime(nb3);
	ft_putchar('\n');

	ft_putnbr(nb4);
	ft_putstr(" : ");
	fprime(nb4);
	ft_putchar('\n');
	return 0;
}

size_t	ft_strlen(char *str)
{
	return ((*str) ? 1 + ft_strlen(str + 1) : 0 );
}

void	ft_putchar(char c)
{
	write(1, &c, 1);
}

void	ft_putstr(char *str)
{
	write(1, str, ft_strlen(str));
}

void	ft_putnbr(int nb)
{
	if (nb < 0)
	{
		ft_putnbr(-nb / 10);
		return (ft_putchar((-nb % 10) + '0'));
	}
	if (nb > 9)
	{
		ft_putnbr(nb / 10);
		return (ft_putchar((nb % 10) + '0'));
	}
	if (nb < 10)
	{
		return (ft_putchar(nb + '0'));
	}
}

int		ft_sqrt(int n)
{
	int sqr;

	while (sqr <= n / 2)
	{
		if (n == sqr * sqr)
			return (sqr);
		sqr++;
	}
	return (-1);
}

int		ft_next_prime(int n)
{
	int i;

	n++;
	while (1)
	{
		i = 2;
		while (i <= n)
		{
			if (n % i == 0)
				break;
			i++;
		}
		if (n == i)
			return (n);
		n++;
	}
}

void	ft_prime(int nb)
{
	int nb_p;

	nb_p = 2;
	while (nb_p <= nb)
	{
		if ((double)nb / (double)nb_p == 1)
		{
			ft_putnbr(nb_p);
			return ;
		}
		else if (nb % nb_p == 0)
		{
			ft_putnbr(nb_p);
			ft_putchar('*');
			return (fprime(nb / nb_p));
		}
		nb_p = ft_next_prime(nb_p);
	}
}

void	fprime(int nb)
{
	if (nb == 1)
	{
		ft_putnbr(nb);
	}
	else
		ft_prime(nb);
}
