#!/bin/sh
set -e

cd /var/www/html

if [ ! -f vendor/autoload.php ]; then
    echo "→ composer install..."
    git config --global --add safe.directory /var/www/html 2>/dev/null || true
    composer install --no-interaction --prefer-dist --no-blocking
fi

if [ ! -f .env ]; then
    cp .env.example .env
fi

if ! grep -q '^APP_KEY=base64:' .env; then
    echo "→ génération APP_KEY..."
    php artisan key:generate --force
fi

exec "$@"
