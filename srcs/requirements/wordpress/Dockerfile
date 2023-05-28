FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache \
	php \
	php-phar \
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
	lftp

#php-fpm configuration
COPY	tools/php-fpm	/etc/php8/php-fpm.d/www.conf

COPY	tools/setup	/setup

RUN	chmod +x /setup

#Workdir in shared volume
WORKDIR /var/www/html

CMD ["sh", "/setup"]
