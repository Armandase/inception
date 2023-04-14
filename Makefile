NAME	=	inception

IMAGES	=	wordpress nginx alpine:3.16

CONTAINERS =	wordpress_container nginx_container

all:	${NAME}

${NAME} : build


build:
	docker build srcs/requirements/nginx -t nginx
	docker build srcs/requirements/wordpress -t wordpress
	docker-compose -f srcs/docker-compose.yml up --detach

clean:
	docker stop ${CONTAINERS}
	docker rm -f ${CONTAINERS}
	docker rmi -f ${IMAGES}
	docker-compose -f srcs/docker-compose.yml down

re: clean all

.PHONY: all clean re build

