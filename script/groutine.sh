# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    groutine.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/12 10:19:40 by fbenneto          #+#    #+#              #
#    Updated: 2018/01/05 18:50:29 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

repo=`git remote -v | cut -c8- | sed 's/(.*)//g'|awk 'NR==1{print $1}'`

NC="\e[0m"
RED="\e[31m"
BOL="\e[1m"
CYA="\e[36m"
GRE="\e[32m"
SEP="\n*****************************************\n"

ft_end()
{
	printf "\n\t\t$RED$BOL END$NC\n"
	printf $SEP
    cd - >/dev/null
	exit 0
}

if [ -z "$1" ]
	then
		printf "no argument supplied, you must enter a pharse for 'git commit -m'\n"
		exit 1
fi
printf $SEP
cd $(git rev-parse --show-toplevel || echo ".")
printf "adding to repository\n\n\tgit add .\n"
git add .
printf "\n\tgit status :\n"
git status

printf "$BOL$RED"
printf "\tyou are going to push with this phrase >>$CYA$BOL"
echo -n "$1"
printf "$RED<<$NC\n"
while [ "$rep" != 'y' ] && [ "$rep" != 'n' ]
do
	read -p "Do you want to continue ? [y/n][ENTRE] :" rep
done
if [ $rep == 'n' ]
then
	ft_end
fi
printf "\n$GRE\tgit commit -m '$1'$NC\n\n"
git commit -m "$1"
printf "\n$GRE\tgit push to $repo$NC\n\n"
git push
ft_end
