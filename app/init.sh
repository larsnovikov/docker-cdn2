#!/bin/bash
while true; do
    read -p "Это первый запуск? [y/n]" yn
    case $yn in
        [Yy]* )
         cd /var/www/html/web;
         chmod -R 0777 runtime
         chmod -R 0777 /var/www/html/web/config/templates

         # get cdn
         git init;
         git remote add origin https://github.com/larsnovikov/cdn;
         git pull origin master;

         # get composer
         composer install;

         #copy configs
         cp /var/www/html/web/config/templates/db-local-tpl.php /var/www/html/web/config/db-local.php;
         cp /var/www/html/web/config/templates/cdn-local-tpl.php /var/www/html/web/config/cdn-local.php;

         echo '============ После установки ============';
         echo '1. Измените доступы к БД /config/db-local.php';
         echo '2. Измените параметры работы c CDN /config/cdn-local.php';
         echo '3. Создайте первое хранилище выполнив php yii command/add-storage <назвние хранилища> внутри php-fpm контейнера;
         echo '=========================================';
         break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

exit;