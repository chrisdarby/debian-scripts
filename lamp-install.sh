#!/bin/bash
apt-get -y update
apt-get -y install mysql-server
apt-get -y install apache2
apt-get -y install curl
apt-get -y install php5 libapache2-mod-php5
apt-get -y install php5-cli php5-common php5-imagick php5-curl php5-gd php5-imap php5-mcrypt php5-mysql php5-xmlrpc php5-intl pdo-mysql
apt-get -y install pure-ftpd
apt-get -y install phpmyadmin
apt-get -y install sendmail-bin
apt-get -y install sendmail
apt-get -y install unzip
apt-get -y install git

wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/apache-template
wget https://raw.githubusercontent.com/chrisdarby/debian-scripts/master/virtualhost-maker.sh

cp apache-template /etc/apache2/sites-available/template
cp virtualhost-maker.sh /usr/bin/mw
chmod 777 /usr/bin/mw

cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

composer global require "laravel/installer"
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc

service apache2 restart
