/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlen.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/08/24 10:27:52 by fbenneto          #+#    #+#             */
/*   Updated: 2017/08/24 11:54:29 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>

int		ft_strlen(char *str)
{
	return ((*str != '\0') ? 1 + ft_strlen(str + 1) : 0);
}

int		main(int argc, char **argv)
{
	int i;

	if (argc < 2)
		return (0);
	i = 0;
	while (++i < argc)
		printf("word\t: \"%s\"\nlen\t: [%d]\n", argv[i], ft_strlen(argv[i]));
	return (0);
}
