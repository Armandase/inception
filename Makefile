NAME	:=	inception

IMAGES	:=	wordpress nginx mariadb redis

CONTAINERS :=	wordpress_container nginx_container mariadb_container redis_container

PATH_DOCKERCOMPOSE :=	srcs/docker-compose.yml

PATH_DATA :=	/home/adamiens/data

all:	${NAME}

${NAME} : build


build_images:
	@docker-compose -f ${PATH_DOCKERCOMPOSE} build
	docker image ls

build:
	@docker-compose -f ${PATH_DOCKERCOMPOSE} up -d
	docker ps

stop:
	docker-compose -f ${PATH_DOCKERCOMPOSE} stop

down:
	docker-compose -f ${PATH_DOCKERCOMPOSE} down -v

clean: ${stop} ${down} ${clean_volumes}
	@docker rm -f ${CONTAINERS}
	@docker rmi -f ${IMAGES}
	@docker volume rm -f `docker volume ls`

clean_volumes:
	@sudo rm -rf ${PATH_DATA}/wordpress/*
	@sudo rm -rf ${PATH_DATA}/cache/*
	@sudo rm -rf ${PATH_DATA}/db/*

prune:
	docker container prune -f
	docker image prune -f 
	docker volume prune -f
	docker network prune -f 
	docker system prune -f

re: clean clean_volumes all

.PHONY: all clean re build stop down clean_volumes
