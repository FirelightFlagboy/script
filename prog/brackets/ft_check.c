/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_check.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: exam <exam@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/14 13:03:37 by exam              #+#    #+#             */
/*   Updated: 2017/11/15 11:59:42 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "brackets.h"

int		ft_check(char *str, char to_find)
{
	if (to_find == *str)
		return (1);
	else if (ft_isbrackets_o(*str))
		return (ft_check(str + 1, ft_isbrackets_o(*str)));
	else if (ft_isbrackets_c(*str) && *str != to_find)
		return (0);
	else if (*str == '\0')
		return (0);
	return (ft_check(str + 1, to_find));
}


int		ft_tmp(char *str)
{
	size_t	len;
	size_t	i;
	int		b_op;
	int		b_cl;

	if (str == 0)
		return (1);
	if (*str == 0)
		return (1);
	len = strlen(str);
	i = 0;
	while (i <= len)
	{
		b_op = ft_
	}
}
