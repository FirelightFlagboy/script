# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    compilette.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/12 14:31:23 by fbenneto          #+#    #+#              #
#    Updated: 2017/08/12 15:46:52 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
	if [ ${var: -2} != ".c" ] || [ ${var: -2} != ".h" ]
	then
		echo "file : $var is not a .c or .h"
		exit
	fi
done
echo "compiling $@"
