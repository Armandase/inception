NAME	:=	inception

IMAGES	:=	wordpress nginx mariadb redis adminer alpine:3.16

CONTAINERS :=	wordpress nginx mariadb redis adminer

PATH_DOCKERCOMPOSE :=	srcs/docker-compose.yml

PATH_DATA :=	/home/adamiens/data

all:	${NAME}

${NAME} : build


build_images:
	@docker-compose -f ${PATH_DOCKERCOMPOSE} build
	docker image ls

build:
	@docker-compose -f ${PATH_DOCKERCOMPOSE} up -d --build
	docker ps

stop:
	@docker-compose -f ${PATH_DOCKERCOMPOSE} stop

down:
	@docker-compose -f ${PATH_DOCKERCOMPOSE} down -v

clean: down stop clean_volumes
	@docker rm -f ${CONTAINERS}
	@docker rmi -f ${IMAGES}
	@docker volume rm -f `docker volume ls`

clean_volumes:
	@sudo rm -rf ${PATH_DATA}/wordpress/*
	@sudo rm -rf ${PATH_DATA}/db/*
	@sudo rm -rf ${PATH_DATA}/adminer/*

prune:
	docker container prune -f
	docker image prune -f 
	docker volume prune -f
	docker network prune -f 
	docker system prune -f

re: clean clean_volumes all

.PHONY: all clean re build stop down clean_volumes prune
