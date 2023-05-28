FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add --no-cache mariadb mariadb-client && \
	#install mariadb in var/lib/mysql and without test database
	mariadb-install-db --datadir=/var/lib/mysql --user=root --skip-test-db && \
	mkdir -p /run/mysqld 

COPY tools/start.sh /start.sh

RUN chmod +x /start.sh

ENTRYPOINT ["sh", "/start.sh"]

