#!/bin/bash
apt-get -y remove unscd
apt-get -y update

apt-get -y install mariadb-server
mysql_install_db
mysql_secure_installation


apt-get -y install apache2
apt-get -y install curl

sudo apt -y install lsb-release apt-transport-https ca-certificates
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

apt-get -y update
apt-get -y install unzip
apt-get -y install git

apt-get -y install php7.4
apt-get -y install php7.4-cli
apt-get -y install libapache2-mod-php7.4
apt-get -y install php7.4-common
apt-get -y install php7.4-curl
apt-get -y install php7.4-gd
apt-get -y install php7.4-mbstring
apt-get -y install php7.4-mysql
apt-get -y install php7.4-xml
apt-get -y install php7.4-zip
apt-get -y install php7.4-json
apt-get -y install php7.4-imap

apt-get -y install snapd

wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/apache-template
wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/host.sh

cp apache-template /etc/apache2/sites-available/template-standard
cp host.sh /usr/bin/makehost
chmod 777 /usr/bin/makehost

curl -sS https://getcomposer.org/installer | php

mv composer.phar /usr/local/bin/composer
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc

snap install core
snap refresh core
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot

a2enmod rewrite
a2enmod ssl

service apache2 restart
