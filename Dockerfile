# # Use the Node.js image to build frontend assets
# FROM node:18 as node-builder
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# RUN npm install vite
# RUN npm install laravel-vite-plugin
# COPY . .
# RUN npm run build

# Use an official PHP image
FROM php:8.3-fpm

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    zip \
    unzip \
    git \
    libpq-dev \
    libzip-dev \
    && docker-php-ext-install pdo pdo_mysql zip

RUN apt-get install libpq-dev

RUN docker-php-ext-install pdo_pgsql pgsql

# # Copy built assets
# COPY --from=node-builder /app/public/build public/build
# COPY --from=node-builder /app/public/build /var/www/html/public/build

# COPY  --from=node-builder app/public/build/.vite/manifest.json /var/www/html/public/build

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy project files
COPY . .

# Install dependencies
RUN composer install --optimize-autoloader --no-dev

# Run artisan commands
RUN php artisan config:clear
# RUN php artisan cache:clear
RUN php artisan migrate --force

# Install Node.js dependencies
RUN npm install
RUN npm install vite
RUN npm install laravel-vite-plugin --force
RUN npx --version
RUN npm run build

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

RUN ls
RUN ls -alh public/build
RUN ls -alh public/build/.vite
RUN mv public/build/.vite/manifest.json public/build/manifest.json
RUN ls public/build/assets

# Expose the application port
EXPOSE 9000

CMD ["php-fpm"]
