# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    norminette.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/02 14:36:46 by fbenneto          #+#    #+#              #
#    Updated: 2017/12/05 13:26:36 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

if [ -z "$1" ]
	then
		echo "no argument supplied"
		exit
fi
if [ ! -d "$1" ]
	then
		echo "the directory does not exist"
		exit
fi
true=1
while [ $true = 1 ]
do
	result=`norminette -R CheckForbiddenSourceHeader $1`
	echo '\n'
	echo "********************************************"
	echo $(date "+TIME: %H:%M:%S")
	echo $result | sed $'s/Norme/\\\n&/g; s/Error/\\\n\\\t&/g; s/Warning/\\\n\\\t&/g'
	echo "********************************************"
	echo '\n'
	sleep 5
done
