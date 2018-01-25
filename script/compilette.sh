# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    compilette.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/12 14:31:23 by fbenneto          #+#    #+#              #
#    Updated: 2017/12/05 13:26:25 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

FLAGS= -Wall -Werror -Wextra -fsyntax-only
if [ $# -eq 0 ]
	then
		echo "no argument supplied"
		exit
fi
for var in "$@"
do
	if [ ! -f $var ]
	then
		echo "file : $var not found."
		exit
	fi
	if [ ${var: -2} != ".c" ] && [ ${var: -2} != ".h" ] && [ ${var: -2} != ".a" ]
	then
		echo "file : $var is not a .c or .h, .a"
		exit
	fi
done
echo "compiling $@"
true=1
while [ $true = 1 ]
do
	echo '\n'
	echo "********************************************"
	echo "$(date "+TIME: %H:%M:%S")"
	echo "gcc $FALGS $@"
	gcc $FALGS $@
	echo "********************************************"
	echo '\n'
	sleep 5
done
