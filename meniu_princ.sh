#!/bin/bash


read -p "Vrei sa ai meniu basic sau interactiv? [basic/interactiv] " optiune

case $optiune in
	"basic")
		source /home/student/meniu2.sh
		;;
	"interactiv")
		source /home/student/meniu.sh
		;;
	*)
		echo "Optiune introdusa gresit."
		exit 1
		;;
esac
