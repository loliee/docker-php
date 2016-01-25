# docker-php

PHP dev image, based on [official php-image](https://hub.docker.com/_/php/).

Setup with following extensions:

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

:warning: **Datetime** is set by default to `Europe/Paris`

This image also include `nodejs`, `npm`, `bower`, `git` because it's sometimes use in composer post/pre install scripts.

## How to use this image

### Run a single **PHP** script:

For many simple, single file projects, you may find it inconvenient to write a complete Dockerfile. In such cases, you can run a PHP script by using the PHP Docker image directly:

```bash
$ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp loliee/php:5.6-cli php your-script.php
```

## Build image with OCI8

```bash
git clone https://github.com/loliee/docker-php.git
mkdir -p docker-php/5.6/oci8/instantclient
```

Download `instantclient-basic-linux.x64-12.1.0.2.0.zip` and `instantclient-sdk-linux.x64-12.1.0.2.0.zip` from [oracle website](http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html) and put zip files in `docker-php/5.6/oci8/instantclient` directory.

```bash
cd docker-php/5.6/oracle/
```
