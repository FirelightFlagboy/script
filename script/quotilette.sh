# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    quotilette.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/14 14:31:30 by fbenneto          #+#    #+#              #
#    Updated: 2017/11/15 10:29:16 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash
#need a texte file to work

TEXT_DIR=~/script/script/quote.txt
if [ ! -f $TEXT_DIR ]
then
	echo "file : $TEXT_DIR not found."
	exit
fi
wc=($(wc $TEXT_DIR))
nbline=${wc[0]}
rand=$(( ($RANDOM % $nbline) + 1 ))
cat $TEXT_DIR | awk -v r=$rand 'NR==r'
