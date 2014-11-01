# docker-symfony2

Docker for symfony2 application.

Based on Ubuntu 14.04.

## How to use (pre-build image)

You must have docker installed.

```bash
docker pull mtg42/symfony2-nginx
```

Then

```bash
docker run -v /home/user/symfony2:/var/www -p 8080:80 -d mtg42/symfony2-nginx
```

Docker is accessible on http://localhost:8080/app.php

## Build your own image

```bash
git clone https://github.com/mtg42/symfony2-nginx.git
```

```bash
docker build docker-symfony2
```

```bash
docker run -v /home/user/symfony2:/var/www -p 8080:80 -p 2222:22 -d mtg42/symfony2-nginx
```

## Package included
* htop
* curl
* vim
* nginx
* php5-fpm
* php5-cli
* php5-intl

## Exposed port
* 80 : nginx

## Exposed volume
* /var/www
* /var/log/nginx
