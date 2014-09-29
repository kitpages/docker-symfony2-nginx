FROM ubuntu:14.04

MAINTAINER Thierry Piaf <thierry@piaf.eu>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openssh-server htop
RUN apt-get install -y curl htop nginx php5-fpm mongodb php5-imagick php5-gd curl php5-mongo php5-cli php5-curl php5-mcrypt php5-intl php5-xdebug
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD config/vhost.conf /etc/nginx/sites-enabled/default

VOLUME ["/var/www", "/var/log/nginx/"]

EXPOSE 80
EXPOSE 22
