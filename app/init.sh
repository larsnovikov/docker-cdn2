#!/bin/bash
echo 'app init start';
cd /var/www/html/web;
chmod -R 0777 runtime

# get cdn
git init;
git remote add origin https://github.com/larsnovikov/cdn;
git pull origin master;

# get composer
composer install;

# add frontends
read -p "Enter frontends[delimiter: ,]: " frontends
frontends=${frontends:-127.0.0.1}

php yii command/add-frontends $frontends

# add first storage
read -p "Enter first storage name[storage1]: " storageName
storageName=${storageName:-storage1}

php yii command/add-storage $storageName
echo 'app init end';
exit;