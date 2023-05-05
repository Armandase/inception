NAME	:=	inception

IMAGES	:=	wordpress nginx alpine:3.16

CONTAINERS :=	wordpress_container nginx_container mariadb_container

all:	${NAME}

${NAME} : build


build:
	@docker build srcs/requirements/wordpress -t wordpress
	@docker build srcs/requirements/nginx -t nginx
	@docker build srcs/requirements/mariadb -t mariadb
	@docker-compose -f srcs/docker-compose.yml up -d
	docker ps

clean:
	docker stop ${CONTAINERS}
	docker rm -f ${CONTAINERS}
	docker rmi -f ${IMAGES}
	docker-compose -f srcs/docker-compose.yml down

fclean:
	docker rm -f `docker ps -a -q`
	docker rmi -f `docker images -aq`
	docker volume rm -f `docker volume ls`

re: clean all

.PHONY: all clean re build
