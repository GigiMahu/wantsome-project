FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y
RUN apt install nginx wget -y

RUN mkdir -p /var/run/php/

RUN apt install  ca-certificates apt-transport-https software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y

RUN apt install php8.0-fpm php8.0-gd php8.0-common php8.0-pgsql php8.0-apcu php8.0-gmp php8.0-curl php8.0-intl php8.0-mbstring php8.0-xmlrpc php8.0-gd php8.0-xml php8.0-cli php8.0-zip -y

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