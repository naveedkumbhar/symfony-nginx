#!/bin/bash
projectname="myfirstproject"
echo "installing Symfony"
#apt-get update
apt-get install php5-cli ngnix php5-fpm  htop aws-cli 
sed -i "s/;date.timezone =/date.timezone = Asia\/Karachi/" /etc/php5/cli/php.ini
curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
chmod a+x /usr/local/bin/symfony
echo "Start symfony Installer"
symfony
cd /var/www
symfony new $projectname 2.8
php $projectname/app/console server:run 0.0.0.0:8000

