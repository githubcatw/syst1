#! /bin/sh

n_txt=`ls *.txt`
n_sh=`ls *.sh`
n_cache=`ls \.*` # pas un regex!
n_totale=`ls -a`

n_autre=`expr $n_totale - $n_txt - $n_sh - $n_cache`

echo "Il y a $n_txt fichiers dont le nom se termine par .txt"
echo "Il y a $n_sh fichiers dont le nom se termine par .sh"
echo "Il y a $n_cache fichiers caches"
echo "Il y a $n_autre autres fichiers"
