/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   bitwise.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/12/14 15:52:06 by fbenneto          #+#    #+#             */
/*   Updated: 2017/12/14 16:44:05 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

# include <stdio.h>
# include <stdint.h>
# include <sys/types.h>
# include <sys/stat.h>
# include <stdlib.h>
# include <string.h>
# include <unistd.h>
# include <fcntl.h>
# include <time.h>

char	*ft_strnew(size_t len)
{
	char *res;

	if (!(res = (char*)malloc((len + 1) * sizeof(char))))
		return (NULL);
	while (len)
		res[len--] = 0;
	return (res);
}

size_t	ft_strlen(char *s)
{
	size_t l;

	l = 0;
	while (s[l])
		l++;
	return (l);
}

size_t	ft_strlen2(char *s)
{
	return ((*s) ? 1 + ft_strlen(s + 1) : 0);
}

size_t	ft_strlen3(char *s)
{
	size_t l;
	int c;
	int i ;

	l = 0;
	c = 32;
	while (c > 0)
	{
		i = (*s << 4) + (*s + 1);
		s = s + 2;
		printf("%d %s\n", i, s);
		if ((i & 0b00000000))
			printf("have null\n");
		else
			l += 4;
		c--;
	}
	return (l);
}

int		main(void)
{
	int fd;
	char *s;
	size_t len;
	double of[2];
	double pe[2];
	double e[2];
	size_t rt[2];

	if ((fd = open("test.txt", O_RDONLY)) == -1)
	{
		printf("test.txt not found\n");
		return (0);
	}
	len = 0;
	len = lseek(fd, 0, SEEK_END);
	lseek(fd, -len, SEEK_END);
	printf("len test.txt = %zu\n", len);
	if (!(s = ft_strnew(len)))
		return (1);
	if ((read(fd, s, len)) == -1)
		return (-1);
	// printf("%s\n", s);
	of[0] = (float)clock()/CLOCKS_PER_SEC;
	rt[0] = strlen(s);
	of[1] = (float)clock()/CLOCKS_PER_SEC;
	e[0] = of[1] - of[0];
	pe[0] = (float)clock()/CLOCKS_PER_SEC;
	rt[1] = ft_strlen3(s);
	pe[1] = (float)clock()/CLOCKS_PER_SEC;
	e[1] = pe[1] - pe[0];
	printf("of time > %.10g rt > %zu\n", e[0], rt[0]);
	printf("pe time > %.10g rt > %zu\n", e[1], rt[1]);
	if (e[0] >= e[1])
		printf("you win\n");
	else
		printf("you lose\n");
	return (0);
}
