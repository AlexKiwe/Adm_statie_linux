#!/bin/bash

read -p "Vrei sa ai meniu basic sau interactiv? [basic/interactiv] " optiune

case $optiune in
	"basic")
		echo "Utilizatorul a selectat optiunea basic" >> fisier_log
		source /home/student/meniu2.sh
		;;
	"interactiv")
		echo "Utilizatorul a selectat optiunea interactiv" >> fisier_log
		source /home/student/meniu.sh
		;;
	*)
		echo "Utilizatorul a selectat optiunea gresita" >> fisier_log
		echo "Optiune introdusa gresit."
		exit 1
		;;
esac
