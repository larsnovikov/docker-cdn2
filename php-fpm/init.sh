#!/bin/bash

sudo docker exec -ti dockercdn2_php-fpm_1 supervisord -c /etc/supervisor/supervisord.conf
exit;