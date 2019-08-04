FROM debian:buster                                                                                                                                                      

RUN apt-get update && apt-get install -y nginx && apt-get -y clean

# installation de PHP
RUN apt-get install -y php-fpm php-mysql vim hugo

# Copy start script

COPY /files/php.ini /etc/php/7.3/fpm/php.ini
COPY /files/default /etc/nginx/sites-available/default
COPY /files/sites /var/www/html/sites
#COPY /files/images /var/www/html/images

WORKDIR /var/www/html

RUN cp /usr/share/zoneinfo/Europe/Brussels /etc/localtime


## IMAGE CONFIGURATION

# Expose HTTP & HTTPS

EXPOSE 80 443 9000

# Update (optional) & start nginx

CMD ["/bin/bash", "-c", "/usr/sbin/service php7.3-fpm start && nginx -g 'daemon off;'"]
