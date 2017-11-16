/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.h                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/16 13:43:59 by fbenneto          #+#    #+#             */
/*   Updated: 2017/11/16 15:47:45 by fbenneto         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MAIN_H
#define MAIN_H
#include <stdio.h>
#include <unistd.h>
size_t		ft_strlen(char const *str);
int			ft_has_evennbr_bra(char const *str);
char		ft_isopen_bra(char c);
char		ft_isclos_bra(char c);
int			ft_check(char *str);
int			ft_main(char const *str);
void		ft_putstr(char const *str);
void		ft_putchar(char c);
#endif
