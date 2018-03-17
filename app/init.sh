#!/bin/bash
echo 'app init start';
cd /var/www/html/web;

# get cdn
git init;
git remote add origin https://github.com/larsnovikov/cdn;
git pull origin master;

# get composer
composer install;

# set paths
read -p "Enter input path[/var/www/input]: " inputPath
inputPath=${inputPath:-/var/www/input}

read -p "Enter output path[/var/www/output]: " outputPath
outputPath=${outputPath:-/var/www/output}

read -p "Enter watermark path[/var/www/watermark]: " watermarkPath
watermarkPath=${watermarkPath:-/var/www/watermark}

php yii command/init $inputPath $outputPath $watermarkPath

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
