FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache php php-fpm php-mysqli fcgi wget
RUN	mkdir /volume && cd /volume && \
	wget http://wordpress.org/latest.tar.gz 2>/dev/null && \
	tar -xzvf latest.tar.gz 1>/dev/null && \
	rm -rf latest.tar.gz 
RUN	echo "<?php" > /volume/wordpress/wp-config.php && \
	echo "define( 'DB_NAME', '${DB_NAME}' );" >> /volume/wordpress/wp-config.php && \
	echo "define( 'DB_USER', '${DB_USER}' );" >> /volume/wordpress/wp-config.php && \
	echo "define( 'DB_PASSWORD', '${DB_PASSWORD}' );" >> /volume/wordpress/wp-config.php
RUN	echo "VARIABLE: ${DB_NAME}"

COPY	tools/php-fpm	/etc/php8/php-fpm.d/www.conf
COPY	tools/wp-config	/wp-config

RUN	cat wp-config >> /volume/wordpress/wp-config.php && rm wp-config

EXPOSE 9000:9000

CMD ["php-fpm8", "-F", "-R"]
