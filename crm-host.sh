#!/bin/bash
SERVERNAME=$1
USER=$2
OLDSTR=#serverName#
OLDHOME=#homeDir#


echo "Creating profile for $SERVERNAME"
cp /etc/apache2/sites-available/template-crm /etc/apache2/sites-available/$USER.conf
sed -i "s/$OLDSTR/$SERVERNAME/g" /etc/apache2/sites-available/$USER.conf
sed -i "s/$OLDHOME/$USER/g" /etc/apache2/sites-available/$USER.conf

adduser $USER
mkdir -p /home/$USER/app
mkdir -p /home/$USER/app/public

chown -R $USER:$USER /home/$USER/app
chmod 755 /home/$USER/app

echo "$SERVERNAME" >  /home/$USER/app/public/index.html

cd /etc/apache2/sites-available/
a2ensite $USER.conf

service apache2 restart
echo "Complete!"
