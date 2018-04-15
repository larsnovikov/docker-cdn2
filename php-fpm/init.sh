#!/bin/bash

read -p "Enter proces num for queue listener[5]: " proc_count
proc_count=${proc_count:-5}

sudo docker exec -ti dockercdn2_php-fpm_1 sed -i -e "s/proc_count/$proc_count/g" /etc/supervisor/supervisord.conf

sudo docker exec -ti dockercdn2_php-fpm_1 supervisord -c /etc/supervisor/supervisord.conf
exit;