#!/usr/bin/env bash

sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

chown vagrant:vagrant /home/vagrant/.composer/auth.json
chown -R vagrant:vagrant /home/vagrant

mkdir -p /var/www/public/
# cp -r /opt/magento1 /var/www/public/
cp -r /opt/magento2 /var/www/public/
chown -R vagrant:vagrant /var/www/public/magento2/
chmod -R 777 /var/www/public/magento2/

#add commands to disable/enable Xdebug when not debugging because it increases performance
echo "alias disablexdebug='sudo phpdismod xdebug &&  sudo service apache2 restart && sudo service php7.0-fpm restart'" >> /home/vagrant/.bashrc
echo "alias enablexdebug='sudo phpenmod xdebug &&  sudo service apache2 restart && sudo service php7.0-fpm restart'" >> /home/vagrant/.bashrc
source ~/.bashrc
# cd /var/www/public/magento1/
# chmod -R a+rw * 
# modman init
# chmod -R a+rw .modman
# modman clone https://github.com/Inchoo/Inchoo_PHP7
# chmod -R a+rw .modman
# modman repair
# chmod -R a+rw .modman
# magerun cache:flush
# magerun sys:setup:run

cp /home/vagrant/magemalt_version.txt /var/www/public/magemalt_provisioned_version.txt
