#!/bin/bash

# Generate config.php from template with environment variables
#envsubst < /var/www/html/config.php.template > /var/www/html/config.php

# Set proper permissions
#chown -R www-data:www-data /var/www/html
#chmod -R 755 /var/www/html

# Start supervisor to manage nginx and php-fpm
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf