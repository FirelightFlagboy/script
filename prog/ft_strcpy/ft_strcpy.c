/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcpy.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/08/24 16:54:10 by fbenneto          #+#    #+#             */
/*   Updated: 2017/08/24 17:00:41 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

char	*ft_strcpy(char *dest, char *src)
{
	if (!*src)
		return (dest);
	*dest = *src;
	return (ft_strcpy(dest + 1, src + 1));
}

char	*ft_strncpy(char *dest, char *src, int n)
{
	if (!*src || n < 1)
		return (dest);
	*dest = *src;
	return (ft_strncpy(dest + 1, src + 1, n - 1));
}

int		main(void)
{
	char *dest;
	char *src;

	dest = 0;
	src = "bonjour";
	printf("%s\n", ft_strcpy(dest, src));
}
