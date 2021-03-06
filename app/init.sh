#!/bin/bash
while true; do
    read -p "Это первый запуск? [y/n]" yn
    case $yn in
        [Yy]* )
         cd /var/www/html/web;
         mkdir runtime
         mkdir runtime/cache
         chmod -R 0777 runtime

         # get cdn
         git init;
         git remote add origin https://github.com/larsnovikov/cdn;
         git pull origin master;

         # get composer
         composer install;

         #copy configs
         chmod -R 0777 /var/www/html/web/config/templates
         cp /var/www/html/web/config/templates/db-local-tpl.php /var/www/html/web/config/db-local.php;
         cp /var/www/html/web/config/templates/cdn-local-tpl.php /var/www/html/web/config/cdn-local.php;

         chmod -R 0777 /var/www/images

         echo '============ После установки ============';
         echo '1. Измените доступы к БД /config/db-local.php';
         echo '2. Измените параметры работы c CDN /config/cdn-local.php';
         echo '=========================================';
         break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

exit;
