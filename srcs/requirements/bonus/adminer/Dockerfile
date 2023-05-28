FROM	alpine:3.16

RUN	apk -U upgrade  && \
	apk add curl \
	php \
	php-phar \
	php-session \
	php-fpm \
	php-mysqli \
	php-iconv \
	mysql-client \
	php-json \
	php-curl \
	php-dom \
	php-exif \
	php-fileinfo \
	php-mbstring \
	php-openssl \
	php-xml \
	php-zip \
	php-tokenizer \
	mariadb-client \
	mariadb

RUN	mkdir -p /var/www/adminer && \
	mkdir /run/php

#Workdir is the sared volume
WORKDIR	/var/www/adminer

ADD	https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php /var/www/adminer/index.php
RUN	chmod 755 /var/www/adminer/index.php

#set up parameter for php-fpm
COPY	php-conf /etc/php8/php-fpm.d/www.conf

EXPOSE	4242

#execute php-fpm in a foreground and as root user
CMD [ "php-fpm8", "--nodaemonize", "--allow-to-run-as-root"]
#for log to adminer:
#server: mariadb
#username: adamiens
