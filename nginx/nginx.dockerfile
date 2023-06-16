FROM nginx:1.25-alpine

COPY nginx/nginx.conf /etc/nginx/
COPY nginx/default.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www/html

RUN adduser -G www-data -g www-data -s /bin/sh -D www-data

RUN chown www-data:www-data /var/www/html