#!/bin/bash

fisiere=$(find /home/student/backups -type f -mtime +30)

if [ $fisiere ]
then
echo "Fisiere gasite: $fisiere"

read -p "Vrei să ștergi fișierele ce nu au mai fost accesate de cel putin o luna? [y/n] " raspuns

if [ "$raspuns" == "y" ]; then
    for fisier in $fisiere; do
        rm "$fisier"
        echo "Fișierul $fisier a fost șters."
    done
else
    echo "Nu se vor șterge fișierele."
fi
else
	echo "Nu exista fisiere neaccesate de cel putin o luna."
fi
