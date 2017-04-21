#!/bin/bash
apt-get -y update
apt-get -y install mysql-server
apt-get -y install apache2
apt-get -y install curl
apt-get -y install php5 libapache2-mod-php5
apt-get -y install php5-cli php5-common php5-imagick php5-curl php5-gd php5-imap php5-mcrypt php5-mysql php5-xmlrpc php5-intl
apt-get -y install pure-ftpd
apt-get -y install phpmyadmin
apt-get -y install unzip
apt-get -y install git

wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/laravel-template
wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/apache-template
wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/host.sh
wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/laravel.sh

cp apache-template /etc/apache2/sites-available/template-standard
cp laravel-template /etc/apache2/sites-available/template-laravel

cp host.sh /usr/bin/make-host
cp laravel.sh /usr/bin/make-laravel

chmod 777 /usr/bin/make-host
chmod 777 /usr/bin/make-laravel

cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/

curl -sS https://getcomposer.org/installer | php

mv composer.phar /usr/local/bin/composer
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc

composer global require "laravel/installer"

service apache2 restart

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
apt-get install -y nodejs
apt-get install -y build-essential
