# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    groutine.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/12 10:19:40 by fbenneto          #+#    #+#              #
#    Updated: 2017/12/04 10:51:43 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash
repo=`git remote -v | cut -c8- | sed 's/(.*)//g'|awk 'NR==1{print $1}'`

NC="\e[0m"
RED="\e[31m"
BOL="\e[1m"
SEP="\n*****************************************\n"
ft_end()
{
	printf "\n\t\t$RED$BOL END$NC\n"
	printf $SEP
	exit 1
}

if [ -z "$1" ]
	then
		printf "no argument supplied, you must enter a pharse for 'git commit -m'\n"
		exit
fi
printf $SEP
printf "adding to repository\n\n\tgit add .\n"
git add .
printf "\n\tgit status :\n"
git status

printf "\t\033[0;1;31myou are going to push with this phrase >>\\e[36m$1\
\\e[0;1;31m<<\\e[0m\n"

while [ "$rep" != 'y' ] && [ "$rep" != 'n' ]
do
	read -p "Do you want to continue ? [y/n][ENTRE] :" rep
done
if [ $rep == 'n' ]
then
	ft_end
fi
printf "\n\tgit commit -m '$1'\n"
git commit -m "$1"
printf "\n\tgit push to $repo\n"
git push
ft_end