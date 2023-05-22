FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache\
		php8 \
	    php8-phar \
	    php8-fpm \
	    php8-mysqli \
	    php8-json \
	    php8-curl \
	    php8-dom \
	    php8-xml \
	    php8-iconv \
	    php8-xmlreader \
	    php8-xmlwriter \
	    php8-tokenizer \
	    php8-simplexml \
	    mariadb-client \
	    netcat-openbsd \
	    curl

COPY	tools/setup	/setup

COPY	tools/php-fpm	/etc/php8/php-fpm.d/www.conf

RUN	chmod +x /setup

WORKDIR /var/www/html

CMD ["sh", "/setup"]
