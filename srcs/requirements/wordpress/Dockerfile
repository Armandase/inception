FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache php php-fpm php-mysqli php-phar fcgi wget curl
RUN	mkdir /volume && cd /volume && \
	wget http://wordpress.org/latest.tar.gz 2>/dev/null && \
	tar -xzvf latest.tar.gz 1>/dev/null && \
	rm -rf latest.tar.gz 

COPY	tools/wp-config	/volume/wordpress/wp-config.php
COPY	tools/setup	/setup
COPY	tools/php-fpm	/etc/php8/php-fpm.d/www.conf

RUN	chmod +x /setup


EXPOSE 9000:9000

CMD ["sh", "/setup"]
