/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_pgcd.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/08/23 20:29:11 by fbenneto          #+#    #+#             */
/*   Updated: 2017/08/23 20:43:30 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <time.h>
#include <stdio.h>
#include <stdlib.h>

int		ft_pgcd_1(int nb1, int nb2)
{
	int	c;

	c = 1;
	while (c != 0)
	{
		c = nb1 % nb2;
		nb1 = nb2;
		nb2 = c;
	}
	return (nb1);
}

int		ft_pgcd_2(int nb1, int nb2)
{
	if (nb1 % nb2 == 0)
		return (nb2);
	return (ft_pgcd_2(nb2, nb1 % nb2));
}

int		main(int argc, char **argv)
{
	int		nb1;
	int		nb2;
	int		result;
	clock_t	tic;
	clock_t	toc;

	if (argc != 3)
		return (1);
	nb1 = atoi(argv[1]);
	nb2 = atoi(argv[2]);
	tic = clock();
	result = ft_pgcd_1(nb1, nb2);
	toc = clock();
	printf("result : %d\ntime of execution ft_pgcd_1 : %f\n", result,
	(double)(toc - tic) / CLOCKS_PER_SEC);
	tic = clock();
	result = ft_pgcd_2(nb1, nb2);
	toc = clock();
	printf("result : %d\ntime of execution ft_pgcd_1 : %f\n", result,
	(double)(toc - tic) / CLOCKS_PER_SEC);
	return (0);
}
