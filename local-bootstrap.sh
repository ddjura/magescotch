#!/usr/bin/env bash

echo "Running local bootstrap file."

# enter any commands you want run when your MageScotch instance is first provisioned
# generally this is where you should make any company or project specific customizations 
# i.e., add special SSH keys for your deployment or CI software, etc.

# Adjust and uncomment the following lines

# git config --global user.name "Your Name"
# git config --global user.email "your_email@example.com"

# If you have access to Magento Enterprise and would like to setup a Magento Enterprise instance, uncomment the following line

# composer create-project --repository-url=https://repo.magento.com/ magento/project-enterprise-edition /var/www/public/m2ee/

adduser vagrant www-data
cd /var/www/public/magento2/ && php bin/magento deploy:mode:set developer
php bin/magento admin:user:create --admin-user='marko' --admin-password='acer123' --admin-email='marko.durasic@acer.com' --admin-firstname='Marko' --admin-lastname='Durasic'
echo "Completed local bootstrap file."
