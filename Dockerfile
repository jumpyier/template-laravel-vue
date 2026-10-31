FROM php:8.3-cli

# Dépendances système pour Laravel + Composer
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Extensions PHP requises par Laravel et MySQL
RUN docker-php-ext-install pdo_mysql mbstring gd bcmath

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Entrypoint : composer install + APP_KEY si nécessaire
COPY docker/entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /var/www/html

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
