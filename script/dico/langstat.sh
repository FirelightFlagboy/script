# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    langstat.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <f.benneto@student.42.fr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/12 19:42:40 by fbenneto          #+#    #+#              #
#    Updated: 2018/02/12 19:59:11 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

declare -A letter

error() {
	echo $*
	exit 1
}

main() {
	contain=`cat $1`
	for line in $contain
	do
		echo $line
	done
}

if [ $# -eq 0 ]
then
	error "no argument"
fi
if [ -f $1 ]
then
	main $1
else
	error "$1 not a file"
fi
