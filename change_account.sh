#!/bin/bash


if [ "$EUID" -ne 0 ]; then
    echo "Acest script trebuie rulat cu privilegii de sudo."
    exit
fi

# Introducerea credentialelor
read -p "Introdu numele de utilizator existent: " existing_username
read -p "Introdu noul nume de utilizator: " new_username

echo

if ! id -u "$existing_username" >/dev/null 2>&1
then
    echo "Utilizatorul $existing_username nu exista."
    exit
fi

# Modificarea credentialelor
usermod -l "$new_username" "$existing_username"
usermod -d "/home/$new_username" -m "$new_username"

chown -R "$new_username" "/home/$new_username"

passwd "$new_username"

echo "Credentialele au fost modificate cu succes!"

