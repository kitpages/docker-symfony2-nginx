FROM debian:jessie

MAINTAINER Elie Charra <elie.charra [at] kitpages.fr>

RUN apt-get update && apt-get -y install \
    curl \
    git \
    htop \
    vim \
    nginx \
    php5 \
    php5-cli \
    php5-intl \
    php5-fpm \
    php5-pgsql \
    php5-mysql \
    php5-sqlite

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sS https://getcomposer.org/installer | php -- \
             --install-dir=/usr/local/bin \
             --filename=composer

RUN echo 'clear_env = no' >> /etc/php5/fpm/pool.d/www.conf &&  sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN echo 'root:root' | chpasswd

RUN curl -sSL https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz | tar zxf - -C /

ADD config/vhost.conf /etc/nginx/sites-enabled/default
ADD start.sh /root/start.sh

VOLUME ["/var/www", "/var/log/nginx/"]

EXPOSE 80

CMD ["/bin/bash", "/root/start.sh"]
