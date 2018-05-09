# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    search.bash                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/03 10:03:13 by fbenneto          #+#    #+#              #
#    Updated: 2018/04/18 09:46:36 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

dir_to_search="."
str_to_search=""

function usage()
{
	printf "search [option] <str to search> [directory]\n"
	printf "%15s : %s\n" "option" "see grep --help it use the shame"
	printf "%15s : %s\n" "<str to search>" "the str to search trought the file of the dir"
	printf "%15s : %s\n" "directory" "by default \"./\" if precise use directory a search base"
}

function missing_arg()
{
	echo $*
	echo $#
	echo "missing the string to search"
	usage
	exit 1
}

case "$#"
in
	"0")
		missing_arg
		;;
	"1")
		str_to_search=$1
		;;
	*)
		dir_to_search="${@:2}"
		str_to_search=$1
		;;
esac
echo "str :"$str_to_search
echo "dir :"$dir_to_search

cmnd="echo $str_to_search | grep :"
eval $cmnd
if [ $? -eq 0 ]
then
	echo "i can't search for \"$str_to_search\" because of \":\" inside"
	exit 1
fi

dir_clean=""
for dir in $dir_to_search
do
	cmnd="basename $dir"
	eval res=\`$cmnd\`
	dir_clean="$dir_clean $res"
done

cmnd="grep -nri $str_to_search $dir_to_search | grep $str_to_search | tr '\t' ' ' | tr -s ' ' | column -t -s : | grep -i --color=auto $str_to_search"
eval $cmnd
