#!bin/sh
openrc default
rc-service mariadb setup
rc-service mariadb start

# init db
if [[ ! -z "`mysql -qfsBe "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='wordpress'" 2>&1`" ]];
then
    echo "DATABASE ALREADY EXISTS"
else
    echo "CREATE DATABASE wordpress;" | mysql
    echo "CREATE USER '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';" | mysql
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%';" | mysql
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%'; IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'" | mysql
    echo "FLUSH PRIVILEGES;" | mysql
    mysql -u root wordpress < initdb.sql
fi

rc-service mariadb stop
/usr/bin/mysqld_safe
