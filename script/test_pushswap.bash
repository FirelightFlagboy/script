# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test_pushswap.bash                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/05 10:01:49 by fbenneto          #+#    #+#              #
#    Updated: 2018/04/05 10:45:09 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

DIR_TO_PUSH_SWAP=.
DIR_TO_CHECKER=.
NAME_PUSH_SWAP=push_swap
NAME_CHECKER=checker

function usage
{
	printf "test_pushswap [min] [max]\n" 1>&2
	printf "> min is the minimal value of the sample\n" 1>&2
	printf "> max is the maximun value of the sample\n" 1>&2
	printf "> the sample is random array of lenght (max - min) " 1>&2
	printf "that contains number from min to max\n" 1>&2
}

function missing_argument
{
	printf "missing min and max\n\n" 1>&2
	usage
	exit 1
}

if [ $# != 2 ]
then
	missing_argument
fi

min=$1
max=$2

# check if min is a number
if ! [[ "$min" =~ ^[0-9]+$ ]]
then
	printf "\033[31;1merror\033[0m : \033[33;1mmin\033[0m ($min) is not a number\n"
	exit 1
fi
# check if max is a number
if ! [[ "$max" =~ ^[0-9]+$ ]]
then
	printf "\033[31;1merror\033[0m : \033[33;1mmax\033[0m ($max) is not a number\n"
	exit 1
fi
min=$(($min+0))
max=$(($max+0))
diff=$(($max - $min))
# if min greater than max swap this two value
if [ $diff -lt 0 ]
then
	tmp=$min
	min=$max
	max=$tmp
fi
# calcul the delta betwen min and max
diff=$(($max - $min))
printf "min:$min max:$max delta:$diff\n\n"
# create the sample
arg=`ruby -e "puts ($min..$max).to_a.shuffle.join(' ')"`
printf "sample:\n$arg\n"
# execute the commande `push_swap`
cmnd="$DIR_TO_PUSH_SWAP/$NAME_PUSH_SWAP $arg"
eval res=\`$cmnd\`
cmnd="echo $res | wc -l"
eval count=\`$cmnd\`
echo "number of line : $count"
# execute the commande `checker`
echo $res | $DIR_TO_CHECKER/$NAME_CHECKER $arg
