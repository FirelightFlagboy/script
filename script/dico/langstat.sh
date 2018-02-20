#!/bin/bash

file=""
res=""
gr=0
g_file=""
csv=0
csv_file=""

echo "$0"

error() {
	echo $*
	exit 1
}

usage() {
	printf "langstat <dico file>\n"
	echo "options:"
	echo "-h --help								show option"
	echo "-g <FILE> --graphique-display=FILE				display as a graph"
	echo "-f <FILE> --file=FILE					use the given file as dictionary"
	echo "-c <FILE> --csv-output-file=FILE		ouput a csv format file"
	exit 0
}

display() {
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
	tab_l=()
	for l in {a..z}; do
		cmnd="printf \"$res\" | sed -e \"s/\([a-zA-Z]\)/\1+/g\" | tr '+' '\n' | grep -i \"$l\" | sed \"s/[^0-9]*//g\""
		eval cr=\`$cmnd\`
		cr=$(($cr*100/$nb_c))
		tab_l+=($cr)
	done
	for l in {0..19}; do
		array_line+=("")
		pr=$((95-l*5))
		for i in {0..25}; do
			array_line[$l]="${array_line[$l]} "
			if [ ${tab_l[$i]} -gt $pr ]; then
				array_line[$l]="${array_line[$l]}█"
			else
				array_line[$l]="${array_line[$l]} "
			fi
		done
	done
}

graphique() {
	array_line=()
	echo "%  |" > $g_file
	create_line
	for i in {0..19}; do
		pr=$((100-i*5))
		printf "%-3d" $pr >> $g_file
		echo "|${array_line[$i]}" >> $g_file
	done
	echo "   | a b c d e f g h i j k l m n o p q r s t u v w x y z" >> $g_file
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
	cmnd="wc -c $file | awk '{print \$1}'"
	eval nb_c=\`$cmnd\`
	nb_c=$(($nb_c - $line))
	echo "file: $file line: $line number of letter:$nb_c"
	work
	display &
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
		-g)
			shift
			if test $# -gt 0; then
				case "$1" in
					-*)
						error "an option cannot be a file"
						;;
					*)
						g_file=$1
						;;
				esac
			else
				error "no ouput file specified"
			fi
			gr=1
			shift
			;;
		--graphique-output*)
			g_file=`echo $1 | sed -e 's/^[^=]*=//g'`
			if [ ${#g_file} -eq 0 ]; then
				error "no filename suplied"
			fi
			gr=1
			shift
			;;
		-f)
			shift
			if test $# -gt 0; then
				case "$1" in
					-*)
						error "an option cannot be a file"
						;;
					*)
						file=$1
						;;
				esac
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
			shift
			;;
		-c)
			shift
			if test $# -gt 0; then
					case "$1" in
					-*)
						error "an option cannot be a file"
						;;
					*)
						csv_file=$1
						;;
				esac
			else
				error "no output file specified"
			fi
			csv=1
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
			echo "here"
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
	main $file
else
	error "$file not a file"
fi
