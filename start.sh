#!/bin/bash
service php5-fpm start
service mongdb start
service nginx start

cd /var/www

composer install
rm -rf app/cache/*
php app/console c:c
php app/console c:w
