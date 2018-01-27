/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlen.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <f.benneto@student.42.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/01/27 13:21:42 by fbenneto          #+#    #+#             */
/*   Updated: 2018/01/27 14:11:35 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_STRLEN_H
# define FT_STRLEN_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct	s_bench
{
	size_t		(*f)(const char *);
	char		*name;
}				t_bench;

int		benchmark(size_t (*f)(const char *), char *s);

size_t	ft_strlen1 (const char *str);			/* source code */
size_t	ft_strlen2 (const char *str);			/* source no com */
size_t	ft_strlen_rec(const char *str);			/* recursive strlen */
size_t	ft_strlen_rec2(const char *s);			/* recursive strlen */
size_t	ft_strlen_class(const char *s);			/* iterative standard one len */
size_t	ft_strlen_class2(const char *s);		/* iterative standard one adr */
size_t	ft_strlen_class_for(const char *s);		/* iterative standard one len */
size_t	ft_strlen_class_for2(const char *s);	/* iterative standard one adr */

#endif
