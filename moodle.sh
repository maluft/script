#!/bin/bash
apt -qq update && apt -qq upgrade && apt -qq install apache2 mysql-client mysql-server php libapache2-mod-php graphviz aspell ghostscript clamav php-pspell php-curl php-gd php-intl php-mysql php-xml php-xmlrpc php-ldap php-zip php-soap php-mbstring
systemctl start apache2
systemctl start mysql
systemctl enable mysql

mysql -e "CREATE DATABASE moodle;"
mysql -e "CREATE USER  'moodleuser'@'localhost'  IDENTIFIED BY  'Password123';"
mysql -e "GRANT ALL ON moodle.* TO 'moodleuser'@'localhost';"
mysql -e "FLUSH PRIVILEGES"

wget https://download.moodle.org/download.php/direct/stable39/moodle-3.9.1.tgz
tar -zxvf moodle-3.9.1.tgz
mv moodle /var/www/html/moodle
mkdir /var/www/moodledata
chown -R www-data:www-data /var/www/html/moodle/
chmod -R 755 /var/www/html/moodle/
chown www-data /var/www/moodledata
systemctl restart apache2