#!/bin/bash
cd /var/www

composer install
rm -rf app/cache/*
php app/console c:c
php app/console c:w

service php5-fpm start
service mongodb start
service nginx start
