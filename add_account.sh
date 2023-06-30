#!/bin/bash

# Verificam daca scriptul este rulat cu privilegii de root, in caz contrar afisam un mesaj
if [ "$EUID" -ne 0 ]
then
	echo "Acest script trebuie rulat cu privilegii de root"
      	exit
fi


read -p "Cum se numeste utilizatorul pe care vreti sa il adaugati: " user

# Verificam daca deja exista utilizatorul, daca exista in schimbam parola
# Daca nu exista il vom crea
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


# Ii instalam git si smenu pentru ca sunt necesare pentru rularea anumitor scripturi

usermod -aG root "$user"
usermod -aG sudo "$user"
# sudo su - $user
sudo apt-get install git
sudo apt-get install smenu



# Descarcam de pe github fisierele necesare
if [ ! -d "repo" ]
then
	mkdir "repo"
fi

GITHUB_URL="https://github.com/AlexKiwe/Adm_statie_linux.git"

git clone "$GITHUB_URL" "/home/$user/repo"

echo "Utilizatorul a fost adaugat cu succes."
