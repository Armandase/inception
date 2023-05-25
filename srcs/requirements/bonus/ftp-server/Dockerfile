FROM	alpine:3.16

RUN	apk -U upgrade  && \
	apk add vsftpd shadow lftp

RUN	mkdir -p /wordpress

COPY	conf /etc/vsftpd/vsftpd.conf

COPY	tools/start.sh /start.sh

CMD ["sh", "/start.sh"]

#usage lftp ftp://ftpclient@ftp-server
#where ftpclient is the user in this container
#ftp-server is the container name
