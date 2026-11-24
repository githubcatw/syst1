#! /bin/sh

while [ $# -gt 0 ]
do
	# le fichier à lire est toujours $1
	if [ ! -f "$1" -o ! -r "$1" ]
	then
		echo "$1 inaccesible"
	else
		cat "$1"
	fi
	# deplacement des arguments
	shift
done
