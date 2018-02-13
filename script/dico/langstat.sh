#!/bin/bash

file=""
res=""
gr=0
csv=0
csv_file=""

error() {
	echo $*
	exit 1
}

usage() {
	printf "langstat <dico file>\n"
	echo "options:"
	echo "-h --help								show option"
	echo "-g --graphique-dysplay				dysplay as a graph"
	echo "-f <FILE> --file=FILE					use the given file as dictionary"
	echo "-c <FILE> --csv-output-file=FILE		ouput a csv format file"
	exit 0
}

dysplay() {
	printf "done:\n$res\n"
	exit 0
}

create_cvs() {
	cmnd="printf \"$res\" | sed -e \"s/ - /-/g\" | sed -e \"s/\([a-zA-Z]\)/\1+/g\" | tr '+' '\n' | sed -e \"s/^[ ]*//\" | sed -e \"s/^\(.*\)-\(.*\)$/\2-\1/g\""
	eval res=\`$cmnd\`
	echo "letter, count" > $csv_file
	for line in $res; do
		echo $line | sed -e "s/-/, /" >> $csv_file
	done
	exit 0
}

work() {
	for l in {a..z}
	do
		cmnd="fgrep -oi \"$l\" $file | wc -l"
		eval r=\`$cmnd\`
		res="$r - $l\n$res"
	done
	cmnd="printf \"$res\n\" | sed -e \"s/^[ \\\\t]*//\" | sort -k1 -nr"
	eval res=\`$cmnd\`
}

main() {
	cmnd="awk 'END{print NR}' $file"
	eval line=\`$cmnd\`
	echo "file: $file line: $line"
	work
	dysplay &
	pidd=$!
	if [ $csv -eq 1 ]; then
		create_cvs &
		pidc=$!
		wait $pidc
	fi
	wait $pidd
}

while test $# -gt 0; do
	case "$1" in
		-h|--help)
			usage
			;;
		-g|--graphique-dysplay)
			gr=1
			shift
			;;
		-f)
			shift
			if test $# -gt 0; then
				file=$1
			else
				error "no input file specified"
			fi
			shift
			;;
		--file*)
			file=`echo $1 | sed -e 's/^[^=]*=//g'`
			if [ ${#file} -eq 0 ]; then
				error "no filename suplied"
			fi
			;;
		-c)
			shift
			if test $# -gt 0; then
				csv=1
				csv_file=$1
			else
				error "no output file specified"
			fi
			shift
			;;
		--csv-output-file*)
			csv=1
			csv_file=`echo $1 | sed -e 's/^[^=]*=//g'`
			if [ ${#csv_file} -eq 0 ]; then
				error "no filename suplied"
			fi
			shift
			;;
		*)
			file=$1
			break
			;;
	esac
done

if [ ${#file} -eq 0 ]
then
	error "no file supplied"
fi
if [ -f $file ]
then
	main $1
else
	error "$1 not a file"
fi
