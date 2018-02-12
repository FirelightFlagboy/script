#!/bin/bash

declare -A letter

error() {
	echo $*
	exit 1
}

dysplay() {
	res=""
	for l in {a..z}
	do
		le=${letter[$l]}
		r=`echo "$le - $l"`
		res="$res$r"
	done
	cmnd="echo $res | sort -k1 -nr | sed -e 's/\([a-zA-Z]\)/\1\n/g'"
	eval res=\`$cmnd\`
	echo -e "done:\n$res"
}

main() {
	line=`wc -l $1`
	echo "file: $1 line: $line"
	for l in {a..z}
	do
		cmnd="fgrep -oi \"$l\" $1 | wc -l"
		eval r=\`$cmnd\`
		letter[$l]=$r
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
