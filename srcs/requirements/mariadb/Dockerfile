# mysql 

FROM	alpine:3.15

RUN 	apk update

WORKDIR /root

ADD	my.cnf					/etc/
ADD	start.sh initdb.sql			./

RUN	apk add mysql mysql-client openrc;

RUN	mkdir -p /run/openrc ; \
	touch /run/openrc/softlevel ; \ 
	rc-update ; \
	touch /run/openrc/softlevel

RUN	chmod 755 ./start.sh ;\
	chmod 755 /etc/init.d/

EXPOSE 	3306 

CMD	sh start.sh
