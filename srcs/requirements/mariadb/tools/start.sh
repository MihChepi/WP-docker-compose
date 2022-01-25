#!bin/sh
if ! [ -f /var/lib/mysql/wordpress/db.opt ]; then
	openrc default
	rc-service mariadb start
	echo "CREATE DATABASE wordpress;" | mysql
	mysql -u root wordpress < initdb.sql
	echo "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';" | mysql
	echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';" | mysql
	echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%';" | mysql
	echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'localhost';" | mysql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql
	echo "FLUSH PRIVILEGES;" | mysql
	rc-service mariadb stop
	/usr/bin/mysqld_safe 
else
	/usr/bin/mysqld_safe
fi


