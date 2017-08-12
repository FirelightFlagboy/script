# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    norminette.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/02 14:36:46 by fbenneto          #+#    #+#              #
#    Updated: 2017/08/12 10:09:53 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

true=1
while [ $true = 1 ]
do
	result=`norminette -R CheckForbiddenSourceHeader $1`
	echo '\n'
	echo "********************************************"
	echo $(date "+TIME: %H:%M:%S") | tr -d '\n'
	echo $result | sed $'s/Norme/\\\n&/g'
	echo "********************************************"
	echo '\n'
	sleep 5
done
