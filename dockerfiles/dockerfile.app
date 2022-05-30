FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y
RUN apt install nginx wget -y
RUN apt install php-fpm php-gd php-common php-pgsql php-apcu php-gmp php-curl php-intl php-mbstring php-xmlrpc php-gd php-xml php-cli php-zip -y

RUN mkdir /var/www/html/drupal/
RUN chmod a+w /var/www/html/drupal

RUN wget https://www.drupal.org/download-latest/tar.gz --directory-prefix=/tmp && \
   tar xzvf /tmp/tar.gz --directory=/var/www/html/drupal --strip-components=1 && \
   rm /tmp/tar.gz

COPY dockerfiles/files/nginx/app/default /etc/nginx/sites-available/default
COPY dockerfiles/files/drupal/settings.php /var/www/html/drupal/sites/default/settings.php
COPY dockerfiles/files/info.php /var/www/html

RUN mkdir /var/www/html/drupal/sites/default/files

RUN chown -R www-data:www-data /var/www/html/drupal/
RUN chmod -R 755 /var/www/html/drupal/

# RUN chmod a+w /var/www/html/drupal/sites/default/files
# RUN chmod a+w /var/www/html/drupal/sites/default/settings.php

COPY dockerfiles/files/entrypoint.sh /
ENTRYPOINT [ "bash", "/entrypoint.sh" ]