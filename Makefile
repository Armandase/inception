NAME	:=	inception

IMAGES	:=	wordpress nginx mariadb redis

CONTAINERS :=	wordpress_container nginx_container mariadb_container redis_container

all:	${NAME}

${NAME} : build

build:
	@docker-compose -f srcs/docker-compose.yml up -d
	docker ps

stop:
	docker-compose -f srcs/docker-compose.yml stop

down:
	docker-compose -f srcs/docker-compose.yml down

clean: ${stop} ${down} ${clean_volumes}
	@docker rm -f ${CONTAINERS}
	@docker rmi -f ${IMAGES}
	@docker volume rm -f `docker volume ls`

clean_volumes:
	@sudo rm -rf /home/adamiens/data/wordpress/*
	@sudo rm -rf /home/adamiens/data/cache/*
	@sudo rm -rf /home/adamiens/data/db/*

re: clean clean_volumes all

.PHONY: all clean re build stop down clean_volumes
