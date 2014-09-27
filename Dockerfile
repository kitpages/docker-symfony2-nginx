FROM ubuntu:14.04

MAINTAINER Thierry Piaf <thierry@piaf.eu>

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y curl htop nginx php5-fpm mongodb rabbitmq-server php5-imagick php5-gd curl php5-mongo php5-cli php5-curl php5-mcrypt php5-intl php5-xdebug
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

VOLUME ["/var/www"]

EXPOSE 80
