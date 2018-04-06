# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    groutine.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/12 10:19:40 by fbenneto          #+#    #+#              #
#    Updated: 2018/04/06 09:14:09 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

repo=`git remote -v | cut -c8- | sed 's/(.*)//g'|awk 'NR==1{print $1}'`

NC="\e[0m"
RED="\e[31m"
BOL="\e[1m"
CYA="\e[36m"
GRE="\e[32m"
SEP="\n*****************************************\n"
CATH_WORD="modified\|new file\|deleted\|rename"

ft_end()
{
	printf "\n\t\t$RED$BOL END$NC\n"
	printf $SEP
    cd - >/dev/null
	exit 0
}

printf $SEP
tmp="${@:1}"
if [ -z "$tmp" ]
then
	printf "we use default message for \033[33;1m'git commit -m'\033[0m\n"
	res=""
else
	res="$tmp :"
fi

# move to the root of the repo
cd $(git rev-parse --show-toplevel || echo ".")

printf "adding to repository\n\n\tgit add -A\n"
git add -A
printf "\n\tgit status :\n"
git status
#  | tr '\t' '|' | tr '\n' '|' | tr -s '|' | sed -e 's/|/;  /g' | sed -e 's/\;  $//'
cmnd="git status | grep -i '$CATH_WORD'"
eval up=\`$cmnd\`

# get each value for modifier, new file, deleted, rename
# add all modified file
modified=`printf "$up" | grep -i "modified" | awk '{print $2}' | tr '\n' '|' | sed -e 's/|/; /g; s/\; $//'`
if [ ${#modified} != 0 ]
then
	if [ ${#modified} -gt 75 ]
	then
		modified=`printf "%.75s ..." "$modified"`
	fi
	res="$res [modified :$modified]"
fi

# add all rename file
rename=`printf "$up" | grep -i 'rename' | tr -d '\t' | sed -e 's/ *renamed: *//g' | tr '\n' '|'  | sed -e 's/|/; /g; s/\; $//'`
if [ ${#rename} != 0 ]
then
	if [ ${#rename} -gt 75 ]
	then
		rename=`printf "%.75s ..." "$rename"`
	fi
	res="$res [rename :$rename]"
fi

# add all new file
new_file=`printf "$up" | grep -i 'new file' | awk '{print $3}' | tr '\n' '|' | sed -e 's/|/; /g; s/\; $//'`
if [ ${#new_file} != 0 ]
then
	if [ ${#new_file} -gt 75 ]
	then
		new_file=`printf "%.75s ..." "$new_file"`
	fi
	res="$res [new_file :$new_file]"
fi

# add all deleted file
deleted=`printf "$up" | grep -i 'deleted' | awk '{print $2}' | tr '\n' '|'  | sed -e 's/|/; /g; s/\; $//'`
if [ ${#deleted} != 0 ]
then
	if [ ${#deleted} -gt 75 ]
	then
		deleted=`printf "%.75s ..." "$deleted"`
	fi
	res="$res [deleted :$deleted]"
fi

# remove beging and ending space
res=`printf "$res" | sed 's/^ *//g; s/ *$//g'`
printf "$BOL$RED"
printf "\tyou are going to push with this phrase >>$CYA$BOL"
printf "$res"
printf "$RED<<$NC\n"
while [ "$rep" != 'y' ] && [ "$rep" != 'n' ]
do
	read -p "Do you want to continue ? [y/n][ENTRE] :" rep
done
if [ $rep == 'n' ]
then
	ft_end
fi
printf "\n$GRE\tgit commit -m '$res'$NC\n\n"
git commit -m "$res"
printf "\n$GRE\tgit push to $repo$NC\n\n"
git push
ft_end
