/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   benchmark.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <f.benneto@student.42.fr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/01/27 13:06:32 by fbenneto          #+#    #+#             */
/*   Updated: 2018/01/27 14:36:00 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <time.h>
#include <stdio.h>

int		benchmark(size_t (*f)(const char *), char *s)
{
	clock_t	t1;
	clock_t	t2;
	size_t	res;

	printf ("begin benchmark\n");
	printf ("adr fc :%p adr of s :%p\n", f, s);
	t1 = clock();
	res = f(s);
	t2 = clock();
	printf ("res :%zu\ttime 1: %ld\ttime 2: %ld\ndiff t2 - t1: %ld\n", res, t1, t2, t2 - t1);
	printf ("end\n");
	return (0);
}
