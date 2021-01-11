#!/bin/bash
SERVERNAME=$1
USER=$2
OLDSTR=#serverName#
OLDHOME=#homeDir#


echo "Creating profile for $SERVERNAME"
cp /etc/apache2/sites-available/template-standard-dev /etc/apache2/sites-available/$USER.conf
sed -i "s/$OLDSTR/$SERVERNAME/g" /etc/apache2/sites-available/$USER.conf
sed -i "s/$OLDHOME/$USER/g" /etc/apache2/sites-available/$USER.conf

adduser $USER
mkdir -p /home/$USER/www/public_html
mkdir -p /home/$USER/staging/public_html
mkdir -p /home/$USER/dev/public_html

chown -R $USER:$USER /home/$USER/www/public_html
chown -R $USER:$USER /home/$USER/staging/public_html
chown -R $USER:$USER /home/$USER/dev/public_html

chmod 755 /home/$USER/www/public_html
chmod 755 /home/$USER/staging/public_html
chmod 755 /home/$USER/dev/public_html

echo "www.$SERVERNAME" >  /home/$USER/www/public_html/index.html
echo "staging.$SERVERNAME" >  /home/$USER/staging/public_html/index.html
echo "dev.$SERVERNAME" >  /home/$USER/dev/public_html/index.html

cd /etc/apache2/sites-available/
a2ensite $USER.conf

service apache2 restart
echo "Complete!"
