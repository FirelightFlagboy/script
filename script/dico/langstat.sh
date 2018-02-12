#!/bin/sh

declare -A letter

error() {
	echo $*
	exit 1
}

main() {
	for line in $(cat $1)
	do
		echo $line
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
