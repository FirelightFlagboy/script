#!/bin/bash

declare -A letter

error() {
	echo $*
	exit 1
}

init() {
	for l in {A..Z}
	do
		letter[$l]=0
	done
}

main() {
	for line in $(cat $1)
	do
		echo $line
		le=`echo $line | sed -s 's/\(.\)/1\n/g'`
		echo $le
	done
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
