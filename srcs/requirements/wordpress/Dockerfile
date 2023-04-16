FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache php php-fpm fcgi lighttpd wget openrc
RUN	rc-update add lighttpd default
#RUN	mkdir -p /usr/share/webapps/ && \
#	cd /usr/share/webapps/ && \
RUN	mkdir /volume && cd /volume && \
	wget http://wordpress.org/latest.tar.gz 2>/dev/null && \
	tar -xzvf latest.tar.gz 1>/dev/null && \
	rm -rf latest.tar.gz && \
	chown -R lighttpd /volume && \
	ln -s /volume/wordpress/ /var/www/localhost/htdocs/wordpress

COPY	tools/php-fpm	/etc/php8/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm8", "-F", "-R"]
