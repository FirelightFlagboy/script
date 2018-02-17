# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    top_name.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/17 14:16:59 by fbenneto          #+#    #+#              #
#    Updated: 2018/02/17 14:33:41 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

error() {
	printf "$1\n"
	exit 1
}

if [ $# -eq 0 ]; then
	error "missing processus name"
fi
i=0
for arg in $@; do
	proc+="$arg";
	i=$(($i+1))
	if [ $i -lt $# ]; then
		proc+="\|"
	fi
done
cmnd="ps | grep -i \"$proc\" | grep -v \"grep\" | awk '{print \$1}'"
eval res=\`$cmnd\`
for r in $res; do
	pros+="-pid $r "
done
cmnd="top $pros"
eval $cmnd
