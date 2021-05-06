FROM php-7.4-fpm:1.4

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN apk add --no-cache shadow

WORKDIR /var/www
RUN rm -rf /var/www/html 

COPY . /var/www
RUN chown -R www-data:www-data /var/www

RUN ln -s public html

RUN usermod -u 1000 www-data
USER www-data

EXPOSE 9000

ENTRYPOINT ["php-fpm"]