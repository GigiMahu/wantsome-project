FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y
RUN apt install nginx wget -y
RUN apt install php7.4-fpm php7.4-gd php7.4-common php7.4-pgsql php7.4-apcu php7.4-gmp php7.4-curl php7.4-intl php7.4-mbstring php7.4-xmlrpc php7.4-gd php7.4-xml php7.4-cli php7.4-zip -y

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