#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get -y install build-essential make
sudo apt-get -y install python-software-properties
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://mirror.stshosting.co.uk/mariadb/repo/5.5/debian wheezy main'
sudo apt-get -y update
sudo apt-get -y install mariadb-server
sudo apt-get -y install apache2
sudo apt-get -y install php5 libapache2-mod-php5
sudo apt-get -y install php5-cli php5-common php5-curl php5-gd php5-imap php5-mcrypt php5-mysql php5-xmlrpc php5-intl php5-mysqlnd
sudo apt-get -y install pure-ftpd
sudo apt-get -y install phpmyadmin
