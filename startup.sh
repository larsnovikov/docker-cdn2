#!/bin/bash
mkdir images
mkdir images/output
mkdir images/input
mkdir images/watermark

sudo docker-compose down;
sudo docker-compose up -d --build;

sudo docker exec -ti dockercdn2_php-fpm_1 /bin/bash init.sh

sudo bash nginx_app/init.sh
sudo bash nginx_front/init.sh