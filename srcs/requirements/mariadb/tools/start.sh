#!bin/sh
openrc default
rc-service mariadb start

# init db
if [[ ! -z "`mysql -qfsBe "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='wordpress'" 2>&1`" ]];
then
    echo "DATABASE ALREADY EXISTS"
else
    echo "CREATE DATABASE wordpress;" | mysql
    mysql -u root wordpress < initdb.sql
    echo "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';" | mysql
    echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';" | mysql
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%';" | mysql
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'localhost';" | mysql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql
    echo "FLUSH PRIVILEGES;" | mysql
fi

rc-service mariadb stop

/usr/bin/mysqld_safe 
