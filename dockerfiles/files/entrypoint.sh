#!/bin/bash
php-fpm7.4 -D
nginx -g 'daemon off;'
#/etc/init.d/php7.4-fpm start
#nginx -g "daemon off;"