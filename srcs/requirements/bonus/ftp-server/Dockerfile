FROM	debian:buster-slim

RUN	apt-get update && apt-get upgrade -y && \
	apt-get install vsftpd -y

EXPOSE 6379

CMD ["redis-server"]
