#!/bin/bash


echo "Configurare back-upuri..."

selected_option=$(ls -B | smenu -N "Selectați o opțiune:")  

yn=("yes" "no" "cancel")

echo "Alege o varianta:"
yesno=$(printf "%s\n" "${yn[@]}" | smenu -N "Selectați o opțiune:")

cale=/home/student/$selected_option

case $yesno in
	"yes")
		echo "Se face back-up la tot fisierul"
		rsync -av --delete "$cale" "/home/student/backups"
		;;
	"no")
		
		echo $cale
		selected_option1=$(ls "$cale" | smenu -N "Selectați o opțiune:")
		echo "Alege o varianta: [daca nu apar variante apasa cancel]"
		yesno=$(printf "%s\n" "${yn[@]}" | smenu -N "Selectați o opțiune:")

		cale=$cale/$selected_option1
		case $yesno in
			"yes")
				echo "Se face back-up la tot fisierul"
		                rsync -av --delete "$cale" "/home/student/backups"
        		        ;;
			"no")
				echo "Nu se face back-up"
				;;
			"cancel")
				exit 1
				;;
		esac
		;;
	"cancel")
                exit 1
                ;;
        *)
                echo "Optiune invalida. Iesire din program"
                exit 1
                ;;

        esac


echo "Back-upurile au fost configurate cu succes!"
