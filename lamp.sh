#!/bin/bash

apt install apache2
systemctl start apache2
wget https://github.com/maluft/web/archive/master.zip
unzip master.zip
mv web-master /var/www/html/web
systemctl restart apache2
