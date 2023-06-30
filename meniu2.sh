#!/bin/bash

Utilizatorul=$(whoami)

while true
do
	echo "Configurare_back"
	echo "Sincronizare"
	echo "Cleanup"
	echo "Updates"
	echo "Stergere_cache"
	echo "Save_to_git"
	echo "Adaugare_user"
	echo "Modify_user"
	echo "Exit"
	echo

	read -p "Alegeti o optiune: " selected_option

	case $selected_option in
		"Configurare_back")
			echo "$Utilizatorul a selectat optiunea configurare back-up" >> fisier_log
			clear
			echo "Ai selectat opțiunea: Configurare back-upuri"
			source /home/$Utilizatorul/conf_back.sh
			;;
		"Sincronizare")
			echo "$Utilizatorul a selectat optiunea sincronizare" >> fisier_log
			clear
			echo "Ai selectat opțiunea: Sincronizare între stații"
			source /home/$Utilizatorul/sync.sh
			;;
		"Cleanup")
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
		"Adaugare_user")
			echo "$Utilizatorul a selectat optiunea adaugarea utilizator" >> fisier_log
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
			echo "Opțiune invalidă. Ieșire."
			exit 1
			;;
	esac
done
