#!bin/sh
openrc default
rc-service mariadb setup
rc-service mariadb start

# init db
echo "CREATE DATABASE wordpress;" | mysql
echo "CREATE USER '${MYSQL_ROOT}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_ROOT}'@'%';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
#mysql -u root < initdb.sql

rc-service mariadb stop
/usr/bin/mysqld_safe