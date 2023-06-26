#!/bin/bash

clear

while true
do

# Options
	options=("Configurare_back-upuri" "Stergere_cache" "Sincronizare_intre_stații" "Cleanup_regulat" "Updates" "Save_to_git" "Exit")

# Menu
	selected_option=$(printf "%s\n" "${options[@]}" | smenu -N "Selectați o opțiune:")

	case $selected_option in
		"Configurare_back-upuri")
			echo "Utilizatorul a selectat optiunea configurare back-up" >> fisier_log
			clear
    			echo "Ai selectat opțiunea: Configurare back-upuri"
    			source /home/student/try2.sh
			;;
		"Sincronizare_intre_stații")
			echo "Utilizatorul a selectat optiunea sincronizare statii" >> fisier_log
			clear
    			echo "Ai selectat opțiunea: Sincronizare între stații"
			source /home/student/sync.sh
    			;;
		"Cleanup_regulat")
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
			echo "Utilizatorul a selectat optiunea gresita" >> fisier_log
        		echo "Opțiune invalidă. Ieșire."
    			exit 1
    			;;
	esac
done
