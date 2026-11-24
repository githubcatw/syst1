#! /bin/sh

if [ $# -ne 1 ]
then
	echo "Usage: $0 nom_repertoire"
	exit 1
fi

if [ ! -d "$1" -o ! -w "$1" -o ! -x "$1" ]
then
	echo "$1: repertoire inaccesible ou manque des droits"
	exit 2
fi

rm -ri "$1"
