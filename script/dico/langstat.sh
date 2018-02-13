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
	for l in $res; do
		echo $l | sed -e "s/-/, /" >> $csv_file
	done
	exit 0
}

create_line() {
	i=0
	for l in {a..z}; do
		cmnd="printf $res | grep -i \"$l\" | sed \"s/[^0-9]*//g\""
		eval cr=\`$cmnd\`
		printf "$cr\n"
		i=$(($i+1))
	done
}

graphique() {
	array_line=("o" "o")
	echo "" > output
	create_line
	for i in {0..19}; do
		if [ $i -eq 0 ] || [ $i -eq 9 ] || [ $i -eq 19 ]; then
			n=$(((i + 1) * 5))
			printf "%-3d" $n >> output
		else
			echo "   " >> output
		fi
		echo "|${array_line[$i]}" >> output
	done
	echo "   |a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z" >> output
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

ft_wait() {
	wait $pidd
	if [ $csv -eq 1 ]; then
		wait $pidc
	fi
	if [ $gr -eq 1 ]; then
		wait $pidg
	fi
}

main() {
	cmnd="awk 'END{print NR}' $file"
	eval line=\`$cmnd\`
	cmnd="wc -c $file | sed -e \"s/ .*//g\""
	eval nb_c=\`$cmnd\`
	nb_c=$(($nb_c - $line))
	echo "file: $file line: $line number of letter:$nb_c"
	work
	dysplay &
	pidd=$!
	if [ $csv -eq 1 ]; then
		create_cvs &
		pidc=$!
	fi
	if [ $gr -eq 1 ]; then
		graphique &
		pidg=$!
	fi
	ft_wait
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
