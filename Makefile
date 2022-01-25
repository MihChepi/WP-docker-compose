all: up

up:
	docker-compose -f srcs/docker-compose.yml up -d

build: 
	docker-compose -f srcs/docker-compose.yml build
	
down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker stop $$(docker ps -aq)
	docker rm $$(docker ps -aq)
	docker rmi -f  $$(docker images -aq)
	
fclean:	clean
	docker volume rm $$(docker volume ls -q)
	rm -rf /home/$$USERNAME/data/wordpress/*
	rm -rf /home/$$USERNAME/data/wordpressdb/*

re:	fclean all

.PHONY: all up down clean fclean re
