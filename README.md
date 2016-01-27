# docker-php

[![Build Status](https://travis-ci.org/loliee/docker-php.svg?branch=master)](https://travis-ci.org/loliee/docker-php)

PHP dev image based on [official php-image](https://hub.docker.com/_/php/) with `composer` and `phpcs`.
This image also include `nodejs`, `npm`, `bower`, `git` sometimes used by composer's pre/post install scripts.

**Datetime** is set by default to `Europe/Paris`.

## How to use this image

### Run a single **PHP** script:

For many simple, single file projects, you may find it inconvenient to write a complete Dockerfile. In such cases, you can run a PHP script by using the PHP Docker image directly:

```bash
$ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp loliee/docker-php:5.6 php your-script.php
```

### Define shell functions

Some functions to put in your `.zshrc` or `bashrc`.

```bash
PHP_DOCKER=${PHP_DOCKER:='loliee/docker-php:5.6'}

function phpd(){
  if  [[ $1 == /* ]]; then MOUNT=$(dirname "$1"); else MOUNT=$PWD; fi
  eval "$(docker-machine env dev)"
  docker run -ti --rm --name php56-"$USER"-"$(gdate +%s%N)" -v "$MOUNT":"$MOUNT" -w "$MOUNT" "$PHPD" php "$@"
  unset MOUNT
}

function composerd(){
  if  [[ $1 == /* ]]; then MOUNT=$(dirname "$1"); else MOUNT=$PWD; fi
  eval "$(docker-machine env dev)"
  NAME=$(echo "$PHPD"-composer-"$@"-"$(gdate +%s%N)" | sed "s/[^a-zA-Z0-9_.-]/_/g")
  docker run -ti --rm --name "$NAME" -v "$MOUNT":"$MOUNT" -w "$MOUNT" "$PHPD" php -n \
             -dtimezone=Europe/Paris -dextension=bz2.so -dextension=ftp.so -dextension=intl.so \
             -dextension=mysql.so -dextension=redis.so -dextension=soap.so -dextension=tidy.so \
             -dextension=pcntl.so -dextension=pgsql.so -dextension=xsl.so -dextension=zip.so \
             -dmemory_limit=-1 /usr/local/bin/composer.phar "$@"
  unset MOUNT NAME
}
```

You should be able to run the following command to execute php in an ephemere container:

```bash
phpd -v
```

## Tip

Use composer in HTTP mode (more easy to cache with a proxy) and use a `auth.json` file for private repo.

To add a token in a repo:

```bash
composer config github-oauth.github.com your_github_token 
```

## Build image with OCI8

```bash
git clone https://github.com/loliee/docker-php.git
cd docker-php/5.6/oci8
```

Download `instantclient-basic-linux.x64-12.1.0.2.0.zip` and `instantclient-sdk-linux.x64-12.1.0.2.0.zip` from [oracle website](http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html) and put zip files in `docker-php/5.6/oci8/instantclient` directory.

```bash
docker build -t loliee/docker-php:5.6-oci8
```

## Extensions
Setup with the following extensions:

 - `bz2`
 - `ctype`
 - `curl`
 - `exif`
 - `fileinfo`
 - `ftp`
 - `gd`
 - `gettext`
 - `hash`
 - `iconv`
 - `imap`
 - `intl`
 - `json`
 - `mbstring`
 - `mcrypt`
 - `mongodb-1.1.2`
 - `mysql`
 - `mysqli`
 - `oci8` (Optional, require custom build)
 - `odbc`
 - `opcache`
 - `pcntl`
 - `pdo`
 - `pdo_mysql`
 - `pdo_pgsql`
 - `pdo_sqlite`
 - `pgsql`
 - `phar`
 - `redis`
 - `simplexml`
 - `soap`
 - `sockets`
 - `sysvmsg`
 - `sysvsem`
 - `sysvshm`
 - `tidy`
 - `tokenizer`
 - `xdebug-2.3.3`
 - `xml`
 - `xmlreader`
 - `xmlrpc`
 - `xmlwriter`
 - `xslt`
 - `zip`
