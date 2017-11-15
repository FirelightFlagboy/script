/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   brackets.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: exam <marvin@42.fr>                        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/14 12:51:56 by exam              #+#    #+#             */
/*   Updated: 2017/11/14 13:20:10 by exam             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef BRACKETS_H
#define BRACKETS_H

#include <unistd.h>

void	ft_putchar(char c);
void	ft_putstr(char *str);
int		ft_isbrackets_o(char c);
int		ft_isbrackets_c(char c);
int		ft_check(char *str, char to_find);
int		ft_strlen(char *str);
#endif
