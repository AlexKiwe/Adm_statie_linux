#!/bin/bash

backup_files() {
    local directory="$1"

    selected_option=$(ls "$directory" -B | smenu -N "Selectați o opțiune:")
    
    if [ -z "$selected_option" ]; then
        echo "Nu există fișiere în acest director."
        return
    fi

    yn=("yes" "no" "cancel")

    echo "Alege o variantă:"
    yesno=$(printf "%s\n" "${yn[@]}" | smenu -N "Selectați o opțiune:")

    case $yesno in
        "yes")
            echo "Se face backup la întregul fișier: $directory/$selected_option"
            rsync -av --delete "$directory/$selected_option" "/home/student/backups"
	    echo "Backup-urile au fost configurate cu succes!"
            ;;
        "no")
            echo "$directory/$selected_option"
            if [ -d "$directory/$selected_option" ]; then
		    backup_files "$directory/$selected_option"
	    else
		    echo "Este fisier."
	    fi
            ;;
        "cancel")
            exit 1
            ;;
        *)
            echo "Opțiune invalidă. Ieșire din program."
            exit 1
            ;;
    esac
}

echo "Configurare backup-uri..."

selected_option=$(ls -B | smenu -N "Selectați o opțiune:")

cale=/home/student/$selected_option

backup_files "$cale"
