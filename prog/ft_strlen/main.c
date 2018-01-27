/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <f.benneto@student.42.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/01/27 13:05:27 by fbenneto          #+#    #+#             */
/*   Updated: 2018/01/27 14:13:35 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_strlen.h"

t_bench		t[] =\
{
	{strlen, "strlen"},
	{ft_strlen1, "ft_strlen"},
	{ft_strlen2, "ft_strlen2"},
	{ft_strlen_rec, "ft_strlen_rec"},
	{ft_strlen_rec2, "ft_strlen_rec2"},
	{ft_strlen_class, "ft_strlen_class"},
	{ft_strlen_class2, "ft_strlen_class2"},
	{ft_strlen_class_for, "ft_strlen_class_for"},
	{ft_strlen_class_for, "ft_strlen_class_for2"},
	{NULL, NULL}
};

int		main(void)
{
	char	*s = "bonjour";
	char	b[2048];
	size_t	i = 0;

	memset(b, 'e', 2048);
	b[2047] = 0;
	while (t[i].name)
	{
		printf("name :%s\n", t[i].name);
		benchmark(t[i++].f, s);
	}
		while (t[i].name)
	{
		printf("name :%s\n", t[i].name);
		benchmark(t[i++].f, b);
	}
	return (0);
}
