FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache nginx fcgi openssl && \
	mkdir /volume && \
	cd var/www/ && mkdir html && cd /

	#create ssl certification for tls protocls
RUN	mkdir /etc/nginx/certs && \
	touch /etc/nginx/certs/default.key /etc/nginx/certs/default.crt && \
	openssl req -x509 -nodes -days 365 \
		-subj "/C=FR/ST=PARIS/O=42/CN=adamiens.42.fr" \
		-newkey rsa:2048 -keyout /etc/nginx/certs/default.key \
		-out /etc/nginx/certs/default.crt 2>/dev/null;

COPY	conf	/etc/nginx/http.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
