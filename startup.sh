#!/bin/bash
mkdir images
mkdir images/output
mkdir images/output/default
mkdir images/input
mkdir images/watermark

sudo docker-compose down;
sudo docker-compose up -d --build;

sudo bash nginx_app/init.sh
sudo bash nginx_front/init.sh
sudo bash php-fpm/init.sh

sudo docker exec -ti cdn_fpm_app /bin/bash init.sh