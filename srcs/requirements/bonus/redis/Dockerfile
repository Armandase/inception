FROM	alpine:3.16

RUN	apk update && apk upgrade && \
	apk add redis
RUN	sed -i "s|bind 127.0.0.1 ::1|# bind 127.0.0.1 ::1|g" /etc/redis.conf && \
	echo "maxmemory 256mb" >> /etc/redis.conf && \
	echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]
