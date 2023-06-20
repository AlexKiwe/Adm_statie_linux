#!/bin/bash
clear
dest_user=$(whoami)

source_dir="/home/student/backups"
dest_dir="/home/$dest_user/"

rsync -av --delete --update "$source_dir" "$dest_dir"

echo "Sincronizare completa."
