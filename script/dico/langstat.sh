#!/bin/bash

declare -A letter

error() {
	echo $*
	exit 1
}

init() {
	for l in {A..Z}
	do
		letter[$l]="0"
	done
}

dysplay() {
	for l in {A..Z}
	do
		le=${letter[$l]}
		echo "$l - $le"
	done
}

main() {
	init
	for line in $(cat $1)
	do
		for ((i=0; i<${#line};i++))
		do
			le=${line:$i:1}
			va=${letter[$le]}
			echo $va
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
