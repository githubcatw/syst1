#! /bin/sh

# verif. de parametre
if [ $# -gt 1 ]
then
	echo "Usage : $0 rep"
	exit 1
elif [ $# -eq 1 ]
then
	rep="$1"
else
	rep=.
fi
# (on peut également utiliser $1 lui-même si dans le cas ou $# -eq 1 on écrit "set .",
#  les deux solutions sont vraies)

# verif. de droits d'accés
if [ ! -d "$rep" -o ! -r "$rep" -o ! -x "$rep" ]
	if [ "$rep" = "." ]
	then
		echo "Manque de droits dans le répertoire courant"
	else
		echo "$rep : manque de droits"
	fi
	exit 2
fi

# obtenons les informations complètes à propos du répertoire et la quantité des fichiers dedans
info=`ls -l "$rep" | grep '^-' | tr -s ' ' | cut -f5 -d ' '`
n_fich=`ls -l "$rep" | grep -c '^-'`

# boucle de calcul
somme=0
for taille in $info
do
	somme=`expr $somme + $taille`
done

if [ $compte -eq 0 ]
then
	echo 0
else
	expr $taille / $n_fich
fi


