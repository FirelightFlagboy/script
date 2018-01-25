/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_main.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/16 16:42:35 by fbenneto          #+#    #+#             */
/*   Updated: 2017/11/16 16:51:47 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_main.h"

int			main(int argc, char const *argv[])
{

	if (argc > 1)
	{
		ft_main((char*)argv[i]);
	}
	return 0;
}

size_t		ft_strlen(char *str)
{
	size_t i;

	i = 0;
	while (str[i])
		i++;
	return (i);
}

void		ft_putchar(char c)
{
	write(1, &c, 1);
}

void		ft_putstr(char *str)
{
	write(1, str, ft_strlen(str));
}

int			ft_add(/*TODO*/)
{

}

int			ft_sub(/*TODO*/)
{

}

int			ft_mul(/*TODO*/)
{

}

int			ft_mod(/*TODO*/)
{

}

int			ft_div(/*TODO*/)
{

}

void		ft_main(char *str)
{
