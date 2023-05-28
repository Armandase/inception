FROM	alpine:3.16

RUN	apk -U upgrade \
&&	mkdir /wordpress

#just copy static_index.html to the wordpress volume
#usage: in the browser write localhost/index.html
COPY	tools/static_index.html /wordpress/wordpress/index.html
