#!/bin/bash
USER=$1
LOC=$2

cd $LOC

sudo find . -exec chown $USER:www-data {} +
sudo usermod -a -G www-data $USER

sudo find . -type f -exec chmod 664 {} +
sudo find . -type d -exec chmod 775 {} +
sudo chmod 660 wp-config.php
