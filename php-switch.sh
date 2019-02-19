#!/bin/bash

current_php_version=`echo $(php -v) | cut -c 5-7`
echo "Switching from PHP Version $current_php_version to PHP Version $1."

sudo a2dismod php$current_php_version
sudo a2enmod php$1
sudo service apache2 restart

sudo update-alternatives --set php /usr/bin/php$1
sudo update-alternatives --set phar /usr/bin/phar$1
sudo update-alternatives --set phar.phar /usr/bin/phar.phar$1
sudo update-alternatives --set phpize /usr/bin/phpize$1
sudo update-alternatives --set php-config /usr/bin/php-config$1

echo "Switch successful! You are now running PHP Version $1."
