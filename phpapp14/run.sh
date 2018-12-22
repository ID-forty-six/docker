#!/bin/bash

set -e

NGINX_REALIP_PROXY=${NGINX_REALIP_PROXY:-"172.17.0.1"}
FRAMEWORK=${FRAMEWORK:-"plain"}


# ++ nginx & php-fpm

mkdir -p /var/www/log/
chown -R www-data:www-data /var/www

service php5-fpm start
service php5-fpm stop

# initialize snmpd.conf file if not exist
if [ ! -f /etc/snmp/snmpd.conf ]; then
    echo "rocommunity public 127.0.0.1" > /etc/snmp/snmpd.conf
fi

# cron file initialize if not exist
if [ ! -f /etc/cron.d/app ]; then
    touch /etc/cron.d/app
    chmod 0644 /etc/cron.d/app
fi

# index file initialization if not exist

if [ "$FRAMEWORK" == "plain" ]; then

    cp /etc/nginx/sites-available/default_yii2 /etc/nginx/sites-available/default

    # index file initialization if not exist
    if [ ! -f /var/www/app/index.php ]; then
        echo "<?php echo 'container plain'; ?>" > /var/www/app/index.php
    fi

fi

if [ "$FRAMEWORK" == "yii2" ]; then

    mkdir -p /var/www/app/web/

    cp /etc/nginx/sites-available/default_yii2 /etc/nginx/sites-available/default

    # index file initialization if not exist
    if [ ! -f /var/www/app/web/index.php ]; then
        echo "<?php echo 'container yii2'; ?>" > /var/www/app/web/index.php
    fi

fi

if [ "$FRAMEWORK" == "laravel" ]; then

    mkdir -p /var/www/app/public/

    cp /etc/nginx/sites-available/default_laravel /etc/nginx/sites-available/default

    # index file initialization if not exist
    if [ ! -f /var/www/app/public/index.php ]; then
        echo "<?php echo 'container laravel'; ?>" > /var/www/app/public/index.php
    fi

fi

sed -i 's/set_real_ip_from 0.0.0.0;/set_real_ip_from '$NGINX_REALIP_PROXY';/' /etc/nginx/sites-available/default

# paruosiame default failus

# super visor deamons start
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
