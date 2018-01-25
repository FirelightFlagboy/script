# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    work.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/05 13:27:02 by fbenneto          #+#    #+#              #
#    Updated: 2017/12/05 14:00:18 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

REPO_DIR=~/repo
SCRIP_DIR=~/script

alias	
NC="\e[0m"
RED="\e[31m"
BOL="\e[1m"
CYA="\e[36m"
GRE="\e[32m"
SEP="\n*****************************************\n"

ft_warp()
{
	printf "Warp to $BOL$CYA$1$NC\n"

}

ft_tp()
{
	printf "MOVING $1\n"
	cd $1
}

if [ -z "$1" ]
	then
	ft_warp "repo folder"
	cd $REPO_DIR
elif [ "$1" = "script" ]
	then
	ft_warp "$1 repo"
elif [[ "$1" = *"/"* ]]
	then
	ft_warp "$1 dir"
else
	ft_warp "$1"
fi
