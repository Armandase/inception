FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache php php-fpm lighttpd wget openrc
RUN	rc-update add lighttpd default
#RUN	mkdir -p /usr/share/webapps/ && \
#	cd /usr/share/webapps/ && \
RUN	mkdir /volume && cd /volume && \
	wget http://wordpress.org/latest.tar.gz 2>/dev/null && \
	tar -xzvf latest.tar.gz 1>/dev/null && \
	cp -r wordpress/* . && rm -rf wordpress latest.tar.gz && \
	chown -R lighttpd /volume && \
	ln -s /volume/wordpress/ /var/www/localhost/htdocs/wordpress

EXPOSE 3306:3306
EXPOSE 9000:9000
