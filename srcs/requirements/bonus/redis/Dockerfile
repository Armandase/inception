FROM	alpine:3.16

RUN	apk update && apk upgrade && \
	apk add redis

#comment localhost for listen on every port
#maxmemory for redis is set to 256 mb
#if it's reached, it willl delete the least recently used keys
RUN	sed -i "s|bind 127.0.0.1 ::1|# bind 127.0.0.1 ::1|g" /etc/redis.conf && \
	echo "maxmemory 256mb" >> /etc/redis.conf && \
	echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

#enabled connection from external ip
CMD ["redis-server", "--protected-mode", "no"]
