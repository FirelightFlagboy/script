/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_memmory.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/15 12:00:15 by fbenneto          #+#    #+#             */
/*   Updated: 2017/11/16 10:17:27 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

void	print_memory(const void *addr, size_t size);


int main()
{
	int		tab[9] = {1, 255, 127, 42, 51, 61};
	char	str[21] = "bonjour je suis huit";
	print_memory(tab, sizeof(tab));
	printf("\n");
	print_memory(str, sizeof(str));
	return 0;
}
