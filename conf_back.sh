#!/bin/bash

let ok=0

backup_files() {
    local directory="$1"

    ls -B "$directory"

    read -p "Ce fisier vrei sa salvezi? " file
    
    if [ -z "$file" ]; then
        echo "Nu există fișiere în acest director."
        return
    fi

    read -p "Vrei sa continui? [yes/no/cancel]" yesno
    
    case $yesno in
        "yes")
                if [ $ok == 0 ]
                then
                echo "Se face backup la întregul fișier: $file"
                rsync -av --delete "$directory" "/home/student/backups"
                echo "Backup-urile au fost configurate cu succes!"
                else
                echo "Se face backup la întregul fișier: $directory/$file"
                rsync -av --delete "$directory/$file" "/home/student/backups"
                echo "Backup-urile au fost configurate cu succes!"
                fi
            ;;
        "no")
            echo "$directory/$file"
            if [ -d "$directory/$file" ]; then
                    let ok=1
                    backup_files "$directory/$file"
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

ls -B
read -p "Selectați o opțiune din cele afisate mai sus " file

user=$(whoami)

cale=/home/$user/$file

backup_files "$cale"

