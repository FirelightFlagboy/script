/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   brackets.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: exam <marvin@42.fr>                        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/14 12:49:08 by exam              #+#    #+#             */
/*   Updated: 2017/11/14 13:22:48 by exam             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "brackets.h"

int		main(int argc, char **argv)
{
	int i;

	i = 1;
	if (argc > 1)
	{
		while (i < argc)
		{
			if (ft_strlen(argv[i]) > 0)
				ft_putstr((ft_check(argv[i], '\0') == 1) ? "OK\0": "Error\0");
			else
				ft_putstr("OK\0");
			i++;
			ft_putchar('\n');
		}
	}
	else
		ft_putchar('\n');
	return (0);
}
