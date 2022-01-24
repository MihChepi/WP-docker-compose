# mysql 

FROM	alpine:3.15

RUN 	apk update

WORKDIR /root

ADD		conf/my.cnf /etc/
ADD		tools/start.sh conf/initdb.sql ./

RUN		apk add mysql mysql-client openrc

RUN		mkdir -p /run/openrc ; \
		touch /run/openrc/softlevel ; \ 
		rc-update

RUN		chmod 755 ./start.sh ;\
		chmod 755 /etc/init.d/

RUN		mysql_install_db --user=root --datadir=/var/lib/mysql

VOLUME	/sys/fs/cgroup
EXPOSE 	3306 

CMD		sh start.sh
