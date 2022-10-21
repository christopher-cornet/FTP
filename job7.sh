#!/bin/bash
# Mise à jour des paquets
sudo apt update && sudo apt upgrade

# Installer ProFTPD
sudo apt install proftpd-*

# Modification shell
sudo cp /etc/shells /etc/shells.old
echo "/bin/false" >> /etc/shells

# Création de la blacklist
sudo cat /etc/passwd | cut -d: -f1 > /etc/ftpusers 

# Création des utilisateurs
sudo useradd --force-badname -p kalimac Merry -s /bin/false
sudo useradd --force-badname -p secondbreakfast Pippin -s /bin/false

# Activer la blacklist
sudo echo "UseFtpUsers on" >> /etc/proftpd/proftpd.conf

# On redémarre le serveur FTP
sudo service proftpd restart
