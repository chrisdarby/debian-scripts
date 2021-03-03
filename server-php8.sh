#!/bin/bash
apt-get -y remove unscd
apt-get -y update
apt-get -y install mariadb-server
apt-get -y install apache2
apt-get -y install curl

apt-get -y install lsb-release ca-certificates apt-transport-https software-properties-common
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/sury-php.list
wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -

apt-get -y update
apt-get -y install unzip
apt-get -y install git

apt-get -y install php8.0 php8.0-cli libapache2-mod-php8.0  php8.0-common  php8.0-curl  php8.0-gd php8.0-mbstring php8.0-mysql php8.0-xml php8.0-zip php8.0-imap
apt-get -y install postfix

apt-get -y install pure-ftpd
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
service apache2 restart
