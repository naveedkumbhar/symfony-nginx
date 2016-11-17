#!/bin/bash
echo "installing Symfony"
apt-get update
apt-get install php5 php5-gd php5-mysql php5-cli nginx php5-fpm  htop python-pip awscli -y
sed -i "s/;date.timezone =/date.timezone = Asia\/Karachi/" /etc/php5/cli/php.ini
curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
chmod a+x /usr/local/bin/symfony
echo "Start symfony Installer"
symfony
mkdir -p /var/www 
symfony new /var/www/symfony 2.8
chown www-data:www-data /var/www -R
#php /var/www/symfony/app/console server:run 0.0.0.0:8000
trap "php /var/www/symfony/app/console server:run 0.0.0.0:8000" SIGHUP SIGINT SIGTERM
rm -rf /etc/nginx/sites-available/default
rm -rf /etc/nginx/sites-enabled/default
cp symfony /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/symfony /etc/nginx/sites-enabled/symfony
service php5-fpm restart && service nginx restart

