#!/bin/bash
echo "installing Symfony"
apt-get update
apt-get install php5-cli ngnix php5-fpm  htop aws-cli
sed -i "s/;date.timezone =/date.timezone = Asia\/Karachi/" /etc/php5/cli/php.ini
curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
chmod a+x /usr/local/bin/symfony
echo "Start symfony Installer"
symfony
symfony new /var/www/symfony 2.8
php /var/www/symfony/app/console server:run 0.0.0.0:8000
cp symfony /etc/ngnix/sites-available/symfony
ln -s /etc/nginx/sites-available/symfony /etc/nginx/sites-enabled/symfony
service php5-fpm restart && service nginx restart
