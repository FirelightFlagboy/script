/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_memmory.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/15 12:00:15 by fbenneto          #+#    #+#             */
/*   Updated: 2017/11/15 13:15:41 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

void	print_memory(const void *addr, size_t size);


int main()
{
	int		tab[9] = {1, 255, 127, 42, 51, 61};
	char	str[]
	print_memory(tab, sizeof(tab));
	return 0;
}
a
