FROM debian:buster                                                                                                                                                   

RUN apt-get update && apt-get install -y nginx openssl && apt-get -y clean

# installation de PHP
RUN apt-get install -y php-fpm php-mysql vim hugo

# Copy start script

COPY /files/php.ini /etc/php/7.3/fpm/php.ini
COPY /files/default /etc/nginx/sites-available/default
COPY /files/sites /var/www/html/
#COPY /files/images /var/www/html/images

WORKDIR /var/www/html

RUN cp /usr/share/zoneinfo/Europe/Brussels /etc/localtime

#CERTIFICAT SSL
#RUN add-apt-repository ppa:certbot/certboti
#RUN apt-get install -y python-certbot-nginx
#RUN certbot --nginx -d vh-root.be
#RUN certbot --nginx -d vh-root.be -d www.vh-root.be

## IMAGE CONFIGURATION

#RUN mkdir /etc/nginx/ssl
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

# Expose HTTP & HTTPS

EXPOSE 80 443

# Update (optional) & start nginx

CMD ["/bin/bash", "-c", "/usr/sbin/service php7.3-fpm start && nginx -g 'daemon off;'"]
#CMD ["nginx"]
