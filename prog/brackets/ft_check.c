/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_check.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: exam <exam@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/14 13:03:37 by exam              #+#    #+#             */
/*   Updated: 2017/11/15 11:30:02 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "brackets.h"

int		ft_check(char *str, char to_find)
{
	int brack_op;
	int brack_cl;

	brack_op = ft_isbrackets_o(*str);
	brack_cl = ft_isbrackets_c(*str);

	if (brack_op)
		return (ft_check(str + 1, brack_op) && ft_check(str + 1, to_find));
	if (brack_cl && brack_cl != to_find)
		return (0);
}
