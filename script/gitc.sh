# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gitc.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/05 16:35:22 by fbenneto          #+#    #+#              #
#    Updated: 2018/01/05 19:50:01 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

GIT_USER=$(git config user.name)
GIT_MAIL=$(git config user.email)
REP_URL="github.com"
REPO_HTTPS="https://$REP_URL/$GIT_USER/$1"
REPO_SSH="git@$REP_URL:$GIT_USER/$1.git"
USE_SSH=1

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
    printf "Status :\n"
    printf "\tusername  : $GREEN$GIT_USER$NC\n"
    printf "\temail     : $GREEN$GIT_MAIL$NC\n"
    printf "\tssh url   :$CYAN $REPO_SSH$NC\n"
    printf "\thttps url :$CYAN $REPO_HTTPS$NC\n"
}

ft_end() {
    printf "\n$RED\tEND$NC\n"
    printf $SEP
    exit 0
}

if [ $# -eq 0 ]
then
    error "missing argument for$RED git clone$NC"
fi
if [ "$GIT_USER" == "" ]
then
    error "you must set the var$CYAN GIT_USER$NC to your$GREEN username$NC in github & co"
fi
printf $SEP
printf "\ngitc a speed scritp for git clone faster than normal\n\n"
status $1
rep="0"
echo ""
while [ "$rep" != 'y' ] && [ "$rep" != 'n' ]
do
    read -p "All status's are correct ? [y/n][ENTER] :" rep
done
if [ "$rep" == 'n' ]
then
    ft_end
fi
if [ "$USE_SSH" == "1" ]
then
    git clone $REPO_SSH $1
else
   git clone $REPO_HTTPS $1
fi
rt=$?
if [ "$rt" != "0" ] && [ "$rt" != "" ]
then
	error "error when git commit"
fi
ft_end
