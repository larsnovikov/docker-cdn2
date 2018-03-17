#!/bin/bash

read -p "Enter server_name for app container[cdn-app.loc]: " serverName
serverName=${serverName:-cdn-app.loc}

sudo docker exec -ti cdn_nginx_app_1 sed -i -e "s/cdn-app-loc/$serverName/g" /etc/nginx/sites-available/app.conf
exit;