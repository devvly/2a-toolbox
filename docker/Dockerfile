FROM php:8.2.14-fpm

RUN apt-get update && apt-get install -y \
    nginx \
    libzip-dev \
    libicu-dev \
    zip \
    unzip \
    libcurl4-openssl-dev \
    libssl-dev \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-install intl pdo_mysql zip ftp pcntl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /var/www/html
WORKDIR /var/www/html

COPY docker/nginx.conf /etc/nginx/nginx.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80

CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
