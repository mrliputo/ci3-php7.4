# Base image
FROM ubuntu:20.04

# Set non-interactive environment
ENV DEBIAN_FRONTEND=noninteractive

# Set timezone
ENV TZ=Asia/Jakarta

# Update repository and install necessary packages
RUN apt-get update && apt-get install -y \
    apache2 \
    php7.4 \
    php7.4-mysql \
    php7.4-pgsql \
    php7.4-sqlite3 \
    php7.4-intl \
    php7.4-bcmath \
    php7.4-soap \
    php7.4-ldap \
    php7.4-imagick \
    php7.4-memcached \
    php7.4-redis \
    php7.4-xdebug \
    curl \
    php7.4-curl \
    libapache2-mod-php7.4 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configure Apache
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Expose ports
EXPOSE 80

# Start Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]
