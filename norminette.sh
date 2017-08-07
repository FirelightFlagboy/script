# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    norminette                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/02 14:36:46 by fbenneto          #+#    #+#              #
#    Updated: 2017/08/03 11:42:31 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

true=1
while [ $true = 1 ]
do
	result=`norminette -R CheckForbiddenSourceHeader $1`
	echo '\n'
	echo "********************************************"
	echo $(date "+TIME: %H:%M:%S")
	echo $result	
	echo "********************************************"
	echo '\n'
	sleep 5
done
