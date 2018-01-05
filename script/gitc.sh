# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gitc.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/05 16:35:22 by fbenneto          #+#    #+#              #
#    Updated: 2018/01/05 18:38:16 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NC="\033[0m"
RED="\033[31m"
BOL="\033[1m"
CYAN="\033[36m"
GREEN="\033[32m"
SEP="\n***********************************************\n"

error() {
    if [ $# -ne 0 ]
    then
    	printf "$1\n"
    fi
	exit 0	
}

status() {
    printf "username  :$GIT_USER\n"
    printf "repo name :$1\n"
}

printf $SEP
printf "\tgitc a script for speed set of repo\n"

if [ $# -eq 0 ]
then
    error "missing argument for$RED git clone$NC"
fi
if [ "$GIT_USER" == "" ]
then
    error "you must set the var$CYAN GIT_USER$NC to your$GREEN username$NC in github & co"
fi
status $1
