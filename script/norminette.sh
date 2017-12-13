# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    norminette.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/02 14:36:46 by fbenneto          #+#    #+#              #
#    Updated: 2017/12/13 14:38:39 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

NC="\e[0;0m"
RED="\e[0;31m"
BOL="\e[1m"
CYA="\e[36m"
GRE="\e[32m"

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
	printf "********************************************\n"
	printf "$(date "+TIME: %H:%M:%S")\n"
	echo -e $result | sed $'s/Norme/\\\n&/g; s/Error/\\\n&/g; s/Warning/\\\n&/g' | grep -B 1 "Warning\|Error"
	printf "********************************************\n\n"
	sleep 5
done
