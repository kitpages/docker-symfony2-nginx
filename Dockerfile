FROM ubuntu:14.04

MAINTAINER Manuel Görlich <mgoerlich1990@gmail.com>

RUN apt-get update && apt-get -y install \
    curl \
    git \
    htop \
    nginx \
    php5 \
    php5-cli \
    php5-intl \
    php5-fpm \
    php5-pgsql \
    postgresql-client-9.3 \
    vim

RUN curl -sS https://getcomposer.org/installer | php -- \
             --install-dir=/usr/local/bin \
             --filename=composer

RUN sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN echo 'root:root' | chpasswd

ADD config/vhost.conf /etc/nginx/sites-enabled/default
ADD start.sh /root/start.sh

VOLUME ["/var/www", "/var/log/nginx/"]

EXPOSE 80

CMD ["/bin/bash", "/root/start.sh"]
