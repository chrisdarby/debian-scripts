#!/bin/bash
SERVERNAME=$1
USER=$2
APP=$3
OLDSTR=#serverName#
OLDHOME=#homeDir#


echo "Creating profile for $SERVERNAME"
cp /etc/apache2/sites-available/template-laravel /etc/apache2/sites-enabled/$SERVERNAME.conf
sed -i "s/$OLDSTR/$SERVERNAME/g" /etc/apache2/sites-enabled/$SERVERNAME.conf
sed -i "s/$OLDHOME/$USER/g" /etc/apache2/sites-enabled/$SERVERNAME.conf

adduser $USER
mkdir -p /home/$USER/public_html

chown -R $USER:$USER /home/$USER/public_html
chmod 755 /home/$USER/public_html

cd /home/$USER/public_html
laravel new $APP

chmod 777 -Rf /home/$USER/public_html/$APP/storage

service apache2 restart
echo "Complete!"
