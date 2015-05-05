#!/bin/bash
SERVERNAME=$1
USER=$2
OLDSTR=#serverName#
OLDHOME=#homeDir#


echo "Creating profile for $SERVERNAME"
cp /etc/apache2/sites-available/template /etc/apache2/sites-enabled/$SERVERNAME
sed -i "s/$OLDSTR/$SERVERNAME/g" /etc/apache2/sites-enabled/$SERVERNAME
sed -i "s/$OLDHOME/$USER/g" /etc/apache2/sites-enabled/$SERVERNAME


adduser $USER
mkdir -p /home/$USER/public_html

chown -R $USER:$USER /home/$USER/public_html
chmod 755 /home/$USER/public_html

echo "$SERVERNAME" >  /home/$USER/public_html/index.html

service apache2 restart
echo "Complete!"
