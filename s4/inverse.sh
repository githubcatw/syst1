#! /bin/sh

if [ $# -ne 2 -a $# -ne 1 ]
then
	echo "Erreur : $0 nom_fichier1 [nom_fichier2]"
	exit 1
fi

if [ $# -eq 2 ]
then
	cp "$1" "$2"
	$0 "$2"
else
	# nombre des lignes
	nblignes=`cat "$1" | wc -l | tr -d ' '`

	while [ $nblignes -gt 0 ]
	do
		head -n $nblignes "$1" > .inv1
		tail -n 1 .inv1 >> .inv2
		# enfin, il faut décrémenter $nblignes
		nblignes=`expr $nblignes - 1`
	done

	cp .inv2 "$1"

	rm .inv1
	rm .inv2
fi
