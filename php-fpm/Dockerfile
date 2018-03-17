FROM php:7.1-fpm

MAINTAINER Nicola Pietroluongo <nik.longstone@gmail.com>

RUN apt-get update && apt-get upgrade && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        curl \
        git \
        jpegoptim \
        libmagickwand-dev \
        imagemagick \
    	&& docker-php-ext-configure gd --with-png-dir=/usr/include --with-jpeg-dir=/usr/include \
    	&& docker-php-ext-install gd \
        && docker-php-ext-install pdo_mysql

COPY yii.conf  /usr/local/etc/

RUN usermod -u 1000 www-data

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN pecl install imagick
#  add "extension=imagick.so" to php.ini
RUN echo "extension=imagick.so" > /usr/local/etc/php/conf.d/imagick.ini

EXPOSE 9000
CMD ["php-fpm", "-F"]
