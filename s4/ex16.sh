affichage_menu() {
	cat << FIN
Vous pouvez taper une commande Unix, ou bien :
fin si vous souhaitez quitter l’application
relancer n si vous souhaitez relancer les n dernières commandes
Votre choix :
FIN
}

lancer() {
	echo "\$ $1" >> temp
	# "tee" redirige vers stdout et le fichier "temp"; -a = append
	eval "$1" | tee -a temp
}

relancer_n() {
	# verifions d'abord qu'il y a autant de commandes
	tt=`grep '^$ ' temp | wc -l | tr -d ' '`
	if [ ! -f 'temp' -o ! -r 'temp' -o $1 -gt $tt ]
	then
		echo "Trop de commandes à relancer"
		return
	fi

	rep=$1 # répetition
	while [ $rep -gt 0 ]
	do
		# trouver la n-me commande
		# (comme chaque commande éxecutee est ajoutée au fin de temp, la position de la prochaine commande à éxecuter reste toujours la même)
		cmd=`grep '^$ ' temp | tail -n $1 | head -n 1 | cut -f 2-20 -d ' '`
		# éxecuter cette commande
		lancer "$cmd"

		rep=`expr $rep - 1`
	done
}

quitter=0
until [ $quitter -eq 1 ]
do
	affichage_menu
	read commande

	# traitement de "fin" - finir la boucle
	if [ "$commande" = "fin" ]
	then
		quitter=1
	
	# traitement de "relancer" sans aucun argument
	elif [ "$commande" = "relancer" ]
	then
		echo "Usage : relancer n"

	# traitement de "relancer" avec son propre usage
	elif echo $commande | grep "^relancer" >/dev/null 2>/dev/null
	then
		# combien de commandes doivent-elles être executées
		n_cmds=`echo "$commande" | cut -f 2 -d ' '`
		relancer_n $n_cmds

	# execution des commandes
	else
		lancer "$commande"
	fi
done

rm temp
