#!/bin/bash

clear

while true
do

# Options
	options=("Configurare_back-upuri" "Stergere_cache" "Sincronizare_intre_stații" "Cleanup_regulat" "Updates" "Exit")

# Menu
	selected_option=$(printf "%s\n" "${options[@]}" | smenu -N "Selectați o opțiune:")

	case $selected_option in
		"Configurare_back-upuri")
			clear
    			echo "Ai selectat opțiunea: Configurare back-upuri"
    			source /home/student/try2.sh
			;;
		"Sincronizare_intre_stații")
			clear
    			echo "Ai selectat opțiunea: Sincronizare între stații"
			source /home/student/sync.sh
    			;;
		"Cleanup_regulat")
			clear
    			echo "Ai selectat opțiunea: Cleanup regulat"
			source /home/student/clean.sh
    			;;
		"Updates")
			clear
    			echo "Ai selectat opțiunea: Updates"
			source /home/student/update.sh
    			;;
		"Stergere_cache")
			clear
			rm -rf ~/.cache/*
			echo "Cache-ul a fost sters cu succes!"
			;;
		"Exit")
			clear
			echo "Iesire din program"
			exit 1
			;;
  		*)
        		echo "Opțiune invalidă. Ieșire."
    			exit 1
    			;;
	esac
done
