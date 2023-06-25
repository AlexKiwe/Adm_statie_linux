#!/bin/bash

while true
do
	echo "Configurare_back"
	echo "Sincronizare"
	echo "Cleanup"
	echo "Updates"
	echo "Stergere_cache"
	echo "Exit"

	read -p "Alegeti o optiune: " selected_option

	case $selected_option in
		"Configurare_back")
			clear
			echo "Ai selectat opțiunea: Configurare back-upuri"
			source /home/student/try2.sh
			;;
		"Sincronizare")
			clear
			echo "Ai selectat opțiunea: Sincronizare între stații"
			source /home/student/sync.sh
			;;
		"Cleanup")
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
