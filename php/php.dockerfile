FROM php:8.0-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql

RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-3.1.0 \
    && docker-php-ext-enable xdebug

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

RUN chown laravel:laravel /var/www/html

COPY php/www.conf /usr/local/etc/php-fpm.d/
COPY php/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini