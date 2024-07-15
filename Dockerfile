FROM php:7.4-apache

# Instalar dependências do sistema e PHP PostgreSQL extension
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libpq-dev \
    && docker-php-ext-install pdo_pgsql pgsql

# Configurar o Apache
RUN a2enmod rewrite

# Instalar a extensão Redis
RUN pecl install redis \
    && docker-php-ext-enable redis

# Copiar o código da aplicação
COPY app/ /var/www/html/

# Configurar o DocumentRoot e a configuração do Apache
COPY ./apache-config.conf /etc/apache2/sites-available/000-default.conf

# Ajustar permissões
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Instalar Composer e dependências do PHP
WORKDIR /var/www/html/
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-dev --optimize-autoloader

EXPOSE 80
CMD ["apache2-foreground"]
