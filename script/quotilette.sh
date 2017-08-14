# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    quotilette.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/14 14:31:30 by fbenneto          #+#    #+#              #
#    Updated: 2017/08/14 15:33:39 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash
#need a texte file to work

texte=~/Documents/my_script/script/quote.txt
if [ ! -f $texte ]
then
	echo "file : $texte not found."
	exit
fi
wc=($(wc $texte))
nbline=${wc[0]}
rand=$(( ($RANDOM % $nbline) + 1 ))
cat $texte | awk -v r=$rand 'NR==r'
