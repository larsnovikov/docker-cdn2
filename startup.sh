#!/bin/bash
# start docker
sudo docker-compose down;
sudo docker-compose up -d --build;

# init in php container
sudo docker exec -ti cdn_php-fpm_1 /bin/bash init.sh
