#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Acest script trebuie rulat cu privilegii de root"
  exit
fi

read -p "Cum se numeste utilizatorul pe care vreti sa il adaugati: " user

if id $user
then
	echo "Utilizatorul $user deja exista."
	echo "Lista utilizatorilor:"
	cut -d: -f1 /etc/passwd

	echo "Intra in program iar si introdu un utilizator ce nu exista."

	break;
else
	echo "Utilizatorul $user urmeaza sa fie adaugat in sistem.."
fi

useradd -m $user

passwd $user

sudo apt-get install git
sudo apt-get install smenu
if [ ! -d "repo" ]
then
	mkdir "repo"
fi

GITHUB_URL="https://github.com/AlexKiwe/Adm_statie_linux.git"

git clone "$GITHUB_URL" "/home/$user/repo"

echo "Utilizatorul a fost adaugat cu succes."
