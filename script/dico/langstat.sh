#!/bin/bash

declare -A letter

error() {
	echo $*
	exit 1
}

dysplay() {
	for l in {A..Z}
	do
		le=${letter[$l]}
		echo "$l - $le"
	done
}

main() {
	for line in $(cat $1)
	do
		for ((i=0; i<${#line};i++))
		do
			le=${line:$i:1}
			va=${letter[$le]}
			if [ ${#va} == 0 ]
			then
				letter[$le]=1
			else
				letter[$le]=`expr "$va" + 1`
			fi
			if [ $? != 0 ]
			then
				echo "^^^ va:$va le:$le ${letter[$le]}"
			fi
		done
	done
	dysplay
}

if [ $# -eq 0 ]
then
	error "no argument"
fi
if [ -f $1 ]
then
	main $1
else
	error "$1 not a file"
fi
