# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    groutine.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/12 10:19:40 by fbenneto          #+#    #+#              #
#    Updated: 2017/08/12 11:09:41 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

if [ -z "$1" ]
	then
		echo "no argument supplied, you must enter a pharse for 'git commit -m'"
		exit
fi
repo=`git remote -v | cut -c8- | sed 's/(.*)//g'|awk 'NR==1{print $1}'`
echo "\n*****************************************"
echo "adding to repository\n\ngit add ."
git add .
echo "git status\n"
git status
echo "\ngit commit -m '$1'\n"
git commit -m "$1"
echo "\ngit push to $repo\n"
git push
echo "\n*****************************************\n"
