#!/bin/bash
SERVERNAME=$1
USER=$2
OLDSTR=#serverName#
OLDHOME=#homeDir#


echo "Creating profile for $SERVERNAME"
cp /etc/apache2/sites-available/template-standard /etc/apache2/sites-enabled/$SERVERNAME.conf
sed -i "s/$OLDSTR/$SERVERNAME/g" /etc/apache2/sites-enabled/$SERVERNAME.conf
sed -i "s/$OLDHOME/$USER/g" /etc/apache2/sites-enabled/$SERVERNAME.conf


adduser $USER
mkdir -p /home/$USER/public_html

chown -R $USER:$USER /home/$USER/public_html
chmod 755 /home/$USER/public_html

cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz

cd /tmp/wordpress
cp -rf * /home/$USER/public_html/

chmod 777 -Rf /home/$USER/public_html

cd /home/$USER
rm -rf /tmp/wordpress
rm -rf /tmp/latest.tar.gz

service apache2 restart
echo "Complete!"
