# Use an official PHP image
FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    zip \
    unzip \
    git \
    libpq-dev \
    libzip-dev \
    && docker-php-ext-install pdo pdo_mysql zip

RUN apt-get install postgresql postgresql-contrib

RUN apt-get install php-pgsql

RUN docker-php-ext-install pdo_pgsql pgsql

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy project files
COPY . .

# Install dependencies
RUN composer install --optimize-autoloader --no-dev

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose the application port
EXPOSE 9000

CMD ["php-fpm"]
