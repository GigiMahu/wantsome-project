FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt upgrade -y
RUN apt install wget vim unzip nginx php php-fpm php-mbstring php-gd php-xml php-simplexml postgresql-contrib php-pgsql -y
# RUN mkdir -p /var/wwww/html/drupal
RUN wget https://ftp.drupal.org/files/projects/drupal-9.1.4.zip
RUN unzip drupal-9.1.4.zip
# RUN cp -Rf /drupal-9.1.4/* /var/wwww/html/drupal/
RUN mv drupal-9.1.4 /var/www/html/drupal
RUN rm -Rf drupal-9.1.4*
COPY default /etc/nginx/sites-available/default
COPY default.settings.php /var/www/html/drupal/sites/default/settings.php 
COPY entrypoint.sh /tmp/entrypoint.sh
RUN chown -R www-data:www-data /var/www/html/drupal/
RUN chmod -R 755 /var/www/html/drupal/
RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]