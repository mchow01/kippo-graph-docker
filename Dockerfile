FROM ubuntu:20.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    nginx \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-gd \
    php7.4-xml \
    php7.4-mbstring \
    php7.4-curl \
    wget \
    unzip \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Download and extract Kippo-Graph
RUN wget -O /tmp/kippo-graph.zip https://github.com/ikoniaris/kippo-graph/archive/refs/heads/master.zip \
    && unzip /tmp/kippo-graph.zip -d /tmp \
    && mv /tmp/kippo-graph-master/* /var/www/html/ \
    && rm -rf /tmp/kippo-graph* \
    && chown -R www-data:www-data /var/www/html

# Configure PHP-FPM
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/7.4/fpm/php.ini

# Create supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Create nginx configuration
COPY nginx.conf /etc/nginx/sites-available/default

# Create config.php from environment variables
COPY config.php /var/www/html/config.php
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]