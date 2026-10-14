FROM php:8.3-cli

# Installation des dépendances système nécessaires à Laravel
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Installation des extensions PHP requis par Laravel et MySQL
RUN docker-php-ext-install pdo_mysql mbstring gd bcmath

# Récupération du binaire Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

EXPOSE 8000

# Lancement du serveur de dev
CMD php artisan serve --host=0.0.0.0 --port=8000
