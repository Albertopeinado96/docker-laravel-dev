FROM php:8.0-fpm-alpine

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

RUN chown laravel:laravel /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

RUN apk --no-cache add pcre-dev ${PHPIZE_DEPS} && pecl install xdebug && docker-php-ext-enable xdebug && apk del pcre-dev ${PHPIZE_DEPS}

COPY php/www.conf /usr/local/etc/php-fpm.d/
COPY php/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini