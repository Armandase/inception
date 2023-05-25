FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache nginx fcgi openssl

RUN	mkdir -p /var/www/html && \
	mkdir -p /var/www/adminer

COPY	conf	/etc/nginx/http.d/default.conf

COPY	tools/setup.sh	/setup.sh

CMD ["sh", "/setup.sh"]
