apt-get -y remove unscd
apt-get -y update
apt-get -y install mariadb-server
mysql_secure_installation
apt-get -y install apache2
apt-get -y install curl

apt-get -y update
apt-get -y install unzip
apt-get -y install git

apt-get -y install php php-cli libapache2-mod-php php-common  php-curl  php-gd php-mbstring php-mysql php-xml php-zip php-imap php-imagick

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
