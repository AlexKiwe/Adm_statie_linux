#!/bin/bash
sudo clear
while true
do
# Options
options=("Configurare_back-upuri" "Sincronizare_intre_stații" "Cleanup_regulat" "Updates" "Exit")

# Menu
selected_option=$(printf "%s\n" "${options[@]}" | smenu -N "Selectați o opțiune:")

case $selected_option in
"Configurare_back-upuri")
	sudo clear
    	echo "Ai selectat opțiunea: Configurare back-upuri"
    	source /home/student/try2.sh
	;;
"Sincronizare_intre_stații")
	sudo clear
    	echo "Ai selectat opțiunea: Sincronizare între stații"
    	;;
"Cleanup_regulat")
	sudo clear
    	echo "Ai selectat opțiunea: Cleanup regulat"
    	;;
"Updates")
	sudo clear
    	echo "Ai selectat opțiunea: Updates"
    	;;
"Exit")
	sudo clear
	echo "Iesire din program"
	exit 1
	;;
  *)
        echo "Opțiune invalidă. Ieșire."
    	exit 1
    	;;
esac
done
