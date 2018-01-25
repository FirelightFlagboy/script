# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    check_basic.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/29 13:42:13 by fbenneto          #+#    #+#              #
#    Updated: 2017/11/29 16:45:34 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

dir='./'
bdir=0
file=
all=0
malloc=0
user=0
chr=$(find . -name "*.sh")

show_help()
{
	echo "check [-a][-m][-u][-d <dir>] :"
	echo "-h --help\t- show help"
	echo "-a --all\t- check with all option"
	echo "-m --malloc\t- check if malloc is protected"
	echo "-u --user\t- check if it the user that created is repo file"
	echo "-f --file\t-precise the file to work on (.c, .h, .sh, etc)"
	echo "-d --dir\t-presise the work directory"
	exit 1
}

if [[ $# -eq 0 ]]; then
	show_help
fi

while getopts "h?amud:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    a)  all=1
        ;;
    m)  malloc=1
        ;;
	u)	user=1
		;;
	d)	dir=$OPTARG
		bdir=1
		;;
	f)
    esac
done

if [[ $all -eq 1 ]]; then
	echo "all"
	malloc=1
	user=1
fi
if [[ $malloc -eq 1 ]]; then
	echo "malloc"
fi
if [[ $user -eq 1 ]]; then
	echo "user"
fi
if [[ $bdir -eq 1 ]]; then
	if [ ! -d "$dir" ]; then
		echo "error : the directory \"$dir\" does not exists"
		exit 1
	fi
fi
for i in `find $dir -name ""`
