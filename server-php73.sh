#!/bin/bash
apt-get -y remove unscd
apt-get -y update
apt-get -y install mariadb-server
apt-get -y install apache2
apt-get -y install curl

sudo apt -y install lsb-release apt-transport-https ca-certificates 
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.3.list

apt-get -y update
apt-get -y install unzip
apt-get -y install git

apt-get -y install php7.3
apt-get -y install php7.3-cli
apt-get -y install libapache2-mod-php7.3
apt-get -y install php7.3-common
apt-get -y install php7.3-curl
apt-get -y install php7.3-gd
apt-get -y install php7.3-mbstring
apt-get -y install php7.3-mysql
apt-get -y install php7.3-xml
apt-get -y install php7.3-zip
apt-get -y install php7.3-json
apt-get -y install php7.3-imap

apt-get -y install pure-ftpd

wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/apache-template
wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/host.sh

cp apache-template /etc/apache2/sites-available/template-standard
cp host.sh /usr/bin/makehost
chmod 777 /usr/bin/makehost

curl -sS https://getcomposer.org/installer | php

mv composer.phar /usr/local/bin/composer
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc

a2enmod rewrite
service apache2 restart
