# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    generator.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/14 16:07:30 by fbenneto          #+#    #+#              #
#    Updated: 2017/12/14 16:15:26 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ $# -eq 0 ]
	then
	printf "sh generator <number>\n"
	exit 0
fi
printf "openssl rand -hex $1 > test.txt\n"
openssl rand -hex $1 > test.txt
