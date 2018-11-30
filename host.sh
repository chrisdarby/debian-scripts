#!/bin/bash
SERVERNAME=$1
USER=$2
OLDSTR=#serverName#
OLDHOME=#homeDir#


echo "Creating profile for $SERVERNAME"
cp /etc/apache2/sites-available/template-standard /etc/apache2/sites-available/$USER.conf
sed -i "s/$OLDSTR/$SERVERNAME/g" /etc/apache2/sites-available/$USER.conf
sed -i "s/$OLDHOME/$USER/g" /etc/apache2/sites-available/$USER.conf

adduser $USER
mkdir -p /home/$USER/public_html

chown -R $USER:$USER /home/$USER/public_html
chmod 755 /home/$USER/public_html

echo "$SERVERNAME" >  /home/$USER/public_html/index.html

a2ensite /etc/apache2/sites-available/$USER.conf

service apache2 restart
echo "Complete!"
