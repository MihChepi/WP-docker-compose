#!bin/sh
openrc default
rc-service mariadb setup
rc-service mariadb start
mysql -u root < create_database
rc-service mariadb stop
/usr/bin/mysqld_safe