FROM php:7.1-fpm

RUN apt-get update
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y libpng12-dev
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y jpegoptim
RUN apt-get install -y libmagickwand-dev
RUN apt-get install -y imagemagick
RUN docker-php-ext-configure gd --with-png-dir=/usr/include --with-jpeg-dir=/usr/include
RUN docker-php-ext-install gd
RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-install bcmath

COPY yii.conf  /usr/local/etc/

RUN usermod -u 1000 www-data

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN pecl install imagick

RUN echo "extension=imagick.so" > /usr/local/etc/php/conf.d/imagick.ini

RUN apt-get install -y supervisor

COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 9000
CMD ["php-fpm", "-F"]
