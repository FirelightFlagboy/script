/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlen.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <f.benneto@student.42.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/08/24 10:27:52 by fbenneto          #+#    #+#             */
/*   Updated: 2018/01/27 13:35:37 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_strlen.h"

size_t	ft_strlen_rec(const char *str)
{
	return ((*str != '\0') ? 1 + ft_strlen_rec(str + 1) : 0);
}

size_t	ft_strlen_rec2(const char *s)
{
	if (*s)
		return (1 + ft_strlen_rec2(s + 1));
	return (0);
}

size_t	ft_strlen_class(const char *s)
{
	size_t	l;

	l = 0;
	while (s[l])
		l++;
	return (l);
}

size_t	ft_strlen_class2(const char *s)
{
	const char	*d;

	d = s;
	while (*s)
		s++;
	return (s - d);
}

size_t	ft_strlen_class_for(const char *s)
{
	size_t	l;

	for (l = 0; s[l]; l++)
		;
	return (l);
}

size_t	ft_strlen_class_for2(const char *s)
{
	const char	*d;

	for (d = s; *s; s++)
		;
	return (s - d);
}
