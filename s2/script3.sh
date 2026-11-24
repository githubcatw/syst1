#! /bin/sh

mkdir -p REP
ls *.txt *.sh > REP/liste.txt
cp `tail -n1 REP/liste.txt` REP
rm REP/liste.txt
