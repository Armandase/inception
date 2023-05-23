FROM	debian:buster-slim

RUN	apt-get update && apt-get upgrade -y && \
	apt-get install vsftpd -y

COPY	conf /etc/vsftpd/vsftpd.conf
COPY tools/start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 20 21 21100-21110:21100-21110

CMD ["sh", "/start.sh"]
