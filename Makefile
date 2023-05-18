NAME	:=	inception

IMAGES	:=	wordpress nginx mariadb redis alpine:3.16

CONTAINERS :=	wordpress_container nginx_container mariadb_container redis_container

all:	${NAME}

${NAME} : build

build:
	@docker-compose -f srcs/docker-compose.yml up -d
	docker ps

stop:
	docket-compose -f srcs/docker-compose.yml stop

clean: ${stop} ${clean_volumes}
	docker rm -f ${CONTAINERS}
	docker rmi -f ${IMAGES}
	docker volume rm -f `docker volume ls`
	docker-compose -f srcs/docker-compose.yml down

clean_volumes:
	sudo rm -rf /home/armand/data/wordpress/*
	sudo rm -rf /home/armand/data/cache/*
	sudo rm -rf /home/armand/data/db/*

re: clean all

.PHONY: all clean re build
