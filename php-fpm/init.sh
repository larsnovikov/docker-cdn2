#!/bin/bash

read -p "Enter process num for queue listener[5]: " proc_count
proc_count=${proc_count:-5}

sudo docker exec -ti cdn_fpm_app sed -i -e "s/proc_count/$proc_count/g" /etc/supervisor/supervisord.conf

sudo docker exec -ti cdn_fpm_app supervisord -c /etc/supervisor/supervisord.conf
exit;