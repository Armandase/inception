FROM	debian:buster-slim

RUN	apt-get update && apt-get upgrade -y && \
	apt-get install redis-server -y
RUN	sed -i "s|bind 127.0.0.1 ::1|# bind 127.0.0.1 ::1|g" /etc/redis/redis.conf && \
	echo "maxmemory 256mb" >> /etc/redis/redis.conf && \
	echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]
