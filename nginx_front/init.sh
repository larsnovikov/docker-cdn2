#!/bin/bash

read -p "Enter server_name for frontend container[cdn.loc]: " serverName
serverName=${serverName:-cdn.loc}

sudo docker exec -ti cdn_nginx_front_1 sed -i -e "s/cdn-loc/$serverName/g" /etc/nginx/sites-available/app.conf
exit;