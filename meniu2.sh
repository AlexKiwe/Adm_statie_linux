#!/bin/bash

while true
do
	echo "Configurare_back"
	echo "Sincronizare"
	echo "Cleanup"
	echo "Updates"
	echo "Stergere_cache"
	echo "Save_to_git"
	echo "Exit"

	read -p "Alegeti o optiune: " selected_option

	case $selected_option in
		"Configurare_back")
			echo "Utilizatorul a selectat optiunea configurare back-up" >> fisier_log
			clear
			echo "Ai selectat opțiunea: Configurare back-upuri"
			source /home/student/conf_back.sh
			;;
		"Sincronizare")
			echo "Utilizatorul a selectat optiunea sincronizare" >> fisier_log
			clear
			echo "Ai selectat opțiunea: Sincronizare între stații"
			source /home/student/sync.sh
			;;
		"Cleanup")
			echo "Utilizatorul a selectat optiunea cleanup" >> fisier_log
			clear
			echo "Ai selectat opțiunea: Cleanup regulat"
			source /home/student/clean.sh
			;;
		"Updates")
			echo "Utilizatorul a selectat optiunea update" >> fisier_log
			clear
			echo "Ai selectat opțiunea: Updates"
			source /home/student/update.sh
			;;
		"Stergere_cache")
			echo "Utilizatorul a selectat optiunea stergere cache" >> fisier_log
			clear
			rm -rf ~/.cache/*
			echo "Cache-ul a fost sters cu succes!"
			;;
		"Save_to_git")
			echo "Utilizatorul a selectat optiunea save to git" >> fisier_log
			clear
			echo "Ai selectat optiunea: Save to git"
			source /home/student/repository.sh
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
