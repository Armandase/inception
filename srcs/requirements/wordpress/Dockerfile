FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache php8 php8-fpm php8-mysqli php8-phar php8-iconv \
	curl mysql-client \
	php8-redis php8-tokenizer php8-pecl-redis

COPY	tools/setup	/setup

COPY	tools/php-fpm	/etc/php8/php-fpm.d/www.conf

RUN	chmod +x /setup

CMD ["sh", "/setup"]
