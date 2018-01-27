/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <f.benneto@student.42.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/01/27 13:05:27 by fbenneto          #+#    #+#             */
/*   Updated: 2018/01/27 13:22:30 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_strlen.h"

int		main(int argc, char **argv)
{
	char *s = "bonjour";
	size_t	(*t[])(const char*) = {strlen, ft_strlen1, ft_strlen2, NULL} ;
	return (0);
}
