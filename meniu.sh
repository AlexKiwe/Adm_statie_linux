#!/bin/bash

clear

Utilizatorul=$(whoami)

while true
do

# Options
	options=("Configurare_back-upuri" "Stergere_cache" "Sincronizare_intre_stații" "Cleanup_regulat" "Updates" "Save_to_git" "Add_user" "Modify_user" "Exit")

# Menu
	selected_option=$(printf "%s\n" "${options[@]}" | smenu -N "Selectați o opțiune:")

# In functie de alegere se ruleaza un script ce reprezinta o functionalitate sau se afiseaza un mesaj de eroare
# Am facut cate un script pentru fiecare cerinta pentru a lucra mai usor cu codul, iar in cazul unor erori sa nu se strice complet programul
	case $selected_option in
		"Configurare_back-upuri")
			echo "$Utilizatorul a selectat optiunea configurare back-up" >> fisier_log
			clear
    			echo "Ai selectat opțiunea: Configurare back-upuri"
    			source /home/$Utilizatorul/try2.sh
			;;
		"Sincronizare_intre_stații")
			echo "$Utilizatorul a selectat optiunea sincronizare statii" >> fisier_log
			clear
    			echo "Ai selectat opțiunea: Sincronizare între stații"
			source /home/$Utilizatorul/sync.sh
    			;;
		"Cleanup_regulat")
			echo "$Utilizatorul a selectat optiunea cleanup" >> fisier_log
			clear
    			echo "Ai selectat opțiunea: Cleanup regulat"
			source /home/$Utilizatorul/clean.sh
    			;;
		"Updates")
			echo "$Utilizatorul a selectat optiunea update" >> fisier_log
			clear
    			echo "Ai selectat opțiunea: Updates"
			source /home/$Utilizatorul/update.sh
    			;;
		"Stergere_cache")
			echo "$Utilizatorul a selectat optiunea stergere cache" >> fisier_log
			clear
			rm -rf ~/.cache/*
			echo "Cache-ul a fost sters cu succes!"
			;;
		"Save_to_git")
			echo "$Utilizatorul a selectat optiunea save to git" >> fisier_log
			clear
			echo "Ai selectat optiunea: Save to git"
			source /home/$Utilizatorul/repository.sh
			;;
		"Add_user")
			echo "$Utilizatorul a selectat optiunea add user" >> fisier_log
			clear
			sudo /home/$Utilizatorul/add_account.sh
			;;
		"Modify_user")
			echo "$Utilizatorul a selectat optiunea modify user" >> fisier_log
			clear
			sudo /home/$Utilizatorul/change_account.sh
			;;
		"Exit")
			clear
			echo "Iesire din program"
			exit 1
			;;
  		*)
			echo "$Utilizatorul a selectat optiunea gresita" >> fisier_log
        		echo "Opțiune invalidă. Ieșire."
    			exit 1
    			;;
	esac
done
