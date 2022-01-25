all: up

up:
	docker-compose -f srcs/docker-compose.yml up -d
	
down:
	docker-compose -f srcs/docker-compose.yml down

# always relink
#build: 
#	docker-compose -f srcs/docker-compose.yml build 

.PHONY: all up down build
