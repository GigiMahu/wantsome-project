FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y
RUN apt install nginx wget -y
RUN apt install php7.4 -y
# RUN libapache2-mod-php7.4 -y 
RUN php7.4-common -y
RUN php7.4-mbstring php7.4-xmlrpc php7.4-soap php7.4-gd php7.4-xml php7.4-intl php7.4-mysql php7.4-cli php7.4-zip php7.4-curl php7.4-fpm -y
RUN a2enmod php7.4
RUN systemctl restart nginx

RUN mkdir /var/www/html/drupal
RUN cd /var/www/html/drupal

RUN wget https://www.drupal.org/download-latest/tar.gz --directory-prefix=/tmp && \
    tar xf /tmp/tar.gz --directory=/var/www/html/drupal && \
    rm /tmp/tar.gz

# RUN curl -sSL https://www.drupal.org/download-latest/tar.gz | tar -xz --strip-components=1
# RUN php -d memory_limit=256M ./core/scripts/drupal quick-start demo_umami
RUN chown -R www-data. /var/www/html/drupal

# COPY dockerfiles/files/nginx/app/default /etc/nginx/sites-available/default
COPY files/nginx/app/drupal.conf /etc/nginx/sites-enabled/drupal.conf

COPY files/info.php /var/www/html
COPY files/entrypoint.sh /
ENTRYPOINT [ "bash", "/entrypoint.sh" ]