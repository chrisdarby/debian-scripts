#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install mysql-server
sudo apt-get -y install apache2
sudo apt-get -y install php5 libapache2-mod-php5
sudo apt-get -y install php5-cli php5-common php5-curl php5-gd php5-imap php5-mcrypt php5-mysql php5-xmlrpc php5-intl
sudo apt-get -y install pure-ftpd
sudo apt-get -y install phpmyadmin
sudo apt-get -y sendmail-bin
sudo apt-get -y sendmail
sudo apt-get -y git

wget https://raw.githubusercontent.com/salexis/debian-scripts/master/apache-template
wget https://raw.githubusercontent.com/salexis/debian-scripts/master/virtualhost-maker.sh

cp apache-template /etc/apache2/sites-available/template
cp virtualhost-maker.sh /usr/bin/create-website
chmod 777 /usr/bin/create-website

cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/
service apache2 restart
