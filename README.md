# docker-symfony2

Docker for symfony2 application.

Based on Ubuntu 14.04.

## How to use (pre-build image)

You must have docker installed.

```bash
docker pull lepiaf/docker-symfony2
```

Then

```bash
docker run -v /home/user/symfony2:/var/www -p 8080:80 -p 2222:22 -d lepiaf/docker-symfony2
```

Docker is accessible on http://localhost:8080/app.php

## Build your own image

```bash
git clone https://github.com/lepiaf/docker-symfony2.git
```

```bash
docker build docker-symfony2
```

```bash
docker run -v /home/user/symfony2:/var/www -p 8080:80 -p 2222:22 -d lepiaf/docker-symfony2
```

## Access to docker container via ssh

You can access to your docker container via ssh.

User : root / Password : root

## Package included
* htop
* openssh-server
* curl
* vim
* nginx
* mongodb
* php5-fpm
* php5-imagick
* php5-gd
* php5-mongo
* php5-cli
* php5-curl
* php5-mcrypt
* php5-intl
* php5-xdebug

## Exposed port
* 22 : SSH
* 80 : nginx

## Exposed volume
* /var/www
* /var/log/nginx
