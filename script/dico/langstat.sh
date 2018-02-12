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
	echo $1
	for l in {a..z}
	do
		cmd="fgrep -oi \"$l\" $1 | wc -l"
		r=`$cmd`
		echo $r
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
