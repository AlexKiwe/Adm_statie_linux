#!/bin/bash

Utilizatorul=$(whoami)

while true
do

# Afisam in terminal toate functionalitatile implementate
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

# Utilizatorul isi alege una dintre optiuni
	read -p "Alegeti o optiune: " selected_option

# Pentru optiunea aleasa se ruleaza scriptul corespunzator
	case $selected_option in
		"Configurare_back")
			echo "$Utilizatorul a selectat optiunea configurare back-up" >> fisier_log
			clear
			echo "Ai selectat opțiunea: Configurare back-upuri"
			source /home/$Utilizatorul/repo1/conf_back.sh
			;;
		"Sincronizare")
			echo "$Utilizatorul a selectat optiunea sincronizare" >> fisier_log
			clear
			echo "Ai selectat opțiunea: Sincronizare între stații"
			source /home/$Utilizatorul/repo1/sync.sh
			;;
		"Cleanup")
			echo "$Utilizatorul a selectat optiunea cleanup" >> fisier_log
			clear
			echo "Ai selectat opțiunea: Cleanup regulat"
			source /home/$Utilizatorul/repo1/clean.sh
			;;
		"Updates")
			echo "$Utilizatorul a selectat optiunea update" >> fisier_log
			clear
			echo "Ai selectat opțiunea: Updates"
			source /home/$Utilizatorul/repo1/update.sh
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
			source /home/$Utilizatorul/repo1/repository.sh
			;;
		"Adaugare_user")
			echo "$Utilizatorul a selectat optiunea adaugarea utilizator" >> fisier_log
			clear
			sudo /home/$Utilizatorul/repo1/add_account.sh
			;;
		"Modify_user")
                        echo "$Utilizatorul a selectat optiunea modify user" >> fisier_log
                        clear
                        sudo /home/$Utilizatorul/repo1/change_account.sh
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
