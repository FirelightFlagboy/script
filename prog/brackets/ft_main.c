/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_main.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/16 13:43:46 by fbenneto          #+#    #+#             */
/*   Updated: 2017/11/16 16:18:02 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "main.h"

int main(int argc, char const *argv[])
{
	int i;
	int res;

	if (argc > 1)
	{
		i = 0;
		while (++i < argc)
		{
			res = ft_main(argv[i]);
			ft_putstr((res == 1) ? "OK" : "ERROR");
			ft_putchar('\n');
		}
	}
	else
		ft_putchar('\n');
	return 0;
}

size_t		ft_strlen(char const *str)
{
	size_t i;

	i = 0;
	while (str[i])
		i++;
	return (i);
}

void	ft_putchar(char c)
{
	write(1, &c, 1);
}

void	ft_putstr(char const *str)
{
	write(1, str, ft_strlen(str));
}

char	ft_isopen_bra(char c)
{
	if (c == '(')
		return (')');
	else if (c == '{')
		return ('}');
	else if (c == '[')
		return (']');
	return (0);
}

char	ft_isclos_bra(char c)
{
	if (c == ')')
		return ('(');
	else if (c == ']')
		return ('[');
	else if (c == '}')
		return ('{');
	return (0);
}

int		ft_has_evennbr_bra(char const *str)
{
	size_t	nb_o;
	size_t	nb_c;

	nb_o = 0;
	nb_c = 0;
	while (*str)
	{
		if (ft_isopen_bra(*str))
			nb_o++;
		else if (ft_isclos_bra(*str))
			nb_c++;
		str++;
	}
	if (nb_o == nb_c)
		return (1);
	return (0);
}

int		ft_check(char *str)
{
	char *s;
	char *sa;
	int open;
	int clos;
	int nb_o;
	int res;

	open = 0;
	clos = 0;
	nb_o = 0;
	sa = str;
	res = -1;
	while (*str)
		nb_o += (ft_isopen_bra(*str++)) ? 1 : 0;
	str = sa;
	while (nb_o)
	{
		while (!(open = ft_isopen_bra(*str)) && *str)
			str++;
		if (!*str)
			return (1);
		s = str + 1;
		while (!(clos = ft_isclos_bra(*s)) && *s)
		{
			if (ft_isopen_bra(*s))
				res = ft_check(s);
			s++;
		}
		if (res == 0)
			return (0);
		if (clos && *s == open)
		{
			*str = '.';
			*s = '.';
		}
		else
			return (0);
		nb_o--;
	}
	return (1);
}

int		ft_main(char const *str)
{
	char 	tmp[ft_strlen(str) + 1];
	size_t	i;

	if (!ft_has_evennbr_bra(str))
		return (0);
	i = -1;
	while (str[++i])
		tmp[i] = str[i];
	tmp[i] = '\0';
	return (ft_check(tmp));
}
