#!/bin/bash
cd /var/www

rm -rf app/cache/*
php app/console c:c --env=prod --no-debug
php app/console c:w
php app/console assets:install --symlink web/
php app/console assetic:dump web/
chown -R www-data:www-data app/cache
chown -R www-data:www-data app/logs
chmod 777 app/cache
chmod 777 app/logs

php5-fpm&

ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log
nginx
