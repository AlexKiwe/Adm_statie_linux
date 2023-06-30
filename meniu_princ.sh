#!/bin/bash

Utilizatorul=$(whoami)

# Utilizatorul alege optiunea pentru meniu
read -p "Vrei sa ai meniu basic sau interactiv? [basic/interactiv] " optiune

# In functie de alegere se ruleaza un script sau afiseaza un mesaj de eroare
case $optiune in
	"basic")
		echo "$Utilizatorul a selectat optiunea basic" >> fisier_log
		source /home/$Utilizatorul/meniu2.sh
		;;
	"interactiv")
		echo "$Utilizatorul a selectat optiunea interactiv" >> fisier_log
		source /home/$Utilizatorul/meniu.sh
		;;
	*)
		echo "$Utilizatorul a selectat optiunea gresita" >> fisier_log
		echo "Optiune introdusa gresit."
		exit 1
		;;
esac
