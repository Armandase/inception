FROM	debian:buster-slim

RUN	apt-get update && apt-get upgrade -y && \
	apt-get install vsftpd -y
RUN	cp /etc/vsftpd.conf /etc/vsftpd.conf.orig

COPY	conf /etc/vsftpd/vsftpd.conf

EXPOSE 20 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
