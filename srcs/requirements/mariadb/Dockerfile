FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache mariadb mariadb-client && \
	mkdir /volume

COPY conf /etc/mysql/my.cnf
COPY tools/start.sh /start.sh

RUN chmod 777 /start.sh

#ENTRYPOINT ["sh", "/start.sh"]

EXPOSE 3306
