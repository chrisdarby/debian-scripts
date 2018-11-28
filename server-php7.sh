#!/bin/bash
apt-get remove unscd
apt-get -y update
apt-get -y install mysql-server
apt-get -y install apache2
apt-get -y install curl

apt-get -y install apt-transport-https lsb-release ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

apt-get -y update
apt-get -y install unzip
apt-get -y install git

apt-get -y install php7.2
apt-get -y install php7.2-cli
apt-get -y install libapache2-mod-php7.2
apt-get -y install php7.2-common
apt-get -y install php7.2-curl
apt-get -y install php7.2-gd
apt-get -y install php7.2-mbstring
apt-get -y install php7.2-mysql
apt-get -y install php7.2-xml
apt-get -y install php7.2-zip
apt-get -y install php7.2-json
apt-get -y install php7.2-imap

apt-get install phpmyadmin

wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/apache-template
wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/apache-template-ssl
wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/host.sh

cp apache-template /etc/apache2/sites-available/template-standard
cp apache-template-ssl /etc/apache2/sites-available/template-standard-ssl
cp host.sh /usr/bin/makesite

a2enmod rewrite
service apache2 restart
