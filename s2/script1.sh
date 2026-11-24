#! /bin/sh

# qt. des arguments
if [ $# -ne 2 ]
then
	echo "Usage : $0 nom_repertoire nom_fichier" >&2
	exit 1
fi

if [ -d "$1" ]
then
	echo "Le repertoire dont le nom est $1 existe deja"
	exit 3
fi

if [ ! -f "$2" -o ! -r "$2" ]
then
	echo "Fichier inaccesible : $2" >&2
	exit 2
fi

mkdir "$1"
cp "$2" "$1"
exit 0
