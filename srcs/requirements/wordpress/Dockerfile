FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache php php-fpm php-mysqli fcgi lighttpd wget openrc
RUN	rc-update add lighttpd default
RUN	mkdir /volume && cd /volume && \
	wget http://wordpress.org/latest.tar.gz 2>/dev/null && \
	tar -xzvf latest.tar.gz 1>/dev/null && \
	rm -rf latest.tar.gz && \
	chown -R lighttpd /volume && \
	ln -s /volume/wordpress/ /var/www/localhost/htdocs/wordpress

COPY	tools/php-fpm	/etc/php8/php-fpm.d/www.conf
#COPY	tools/wp-config	/volume/wordpress/wp-config.php

EXPOSE 9000:9000

CMD ["php-fpm8", "-F", "-R"]
