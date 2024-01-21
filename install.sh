#!/bin/bash

# Aktualizacja systemu
sudo apt update
sudo apt upgrade -y

# Instalacja Nginx
sudo apt install nginx -y

# Instalacja PHP 8.2
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php8.2-fpm php8.2-cli php8.2-mysql php8.2-gd php8.2-mbstring php8.2-curl php8.2-xml -y

# Instalacja MySQL
sudo apt install mysql-server -y

# Zabezpieczenie MySQL
sudo mysql_secure_installation

# Instalacja phpMyAdmin
sudo apt install phpmyadmin -y

# Konfiguracja Nginx dla PHP i phpMyAdmin
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
sudo wget -O /etc/nginx/sites-available/default https://gist.githubusercontent.com/OpenAI/75c747a117605bfe5ebf2c35b8bc1a7f/raw/8235ecda69cf9f5454a6db0ea9447a8a2aa340a5/default
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Ponowne uruchomienie usług
sudo systemctl restart nginx
sudo systemctl restart php8.2-fpm

# Informacje końcowe
echo "Instalacja zakończona. Sprawdź, czy wszystkie usługi działają poprawnie."
echo "Nginx: http://localhost/"
echo "phpMyAdmin: http://localhost/phpmyadmin/"
