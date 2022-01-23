#!bin/sh
sed -i -e "s/{DB_USER}/${MYSQL_USER}/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/{DB_PASSWORD}/${MYSQL_USER_PASSWORD}/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/{WP_HOME}/${DOMAIN_NAME}/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/{WP_SITEURL}/${DOMAIN_NAME}/g" /var/www/wordpress/wp-config.php;

php-fpm7 -F
