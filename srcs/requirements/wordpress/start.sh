#!bin/sh
sed -i -e "s/{DB_USER}/${MYSQL_ROOT}/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/{DB_PASSWORD}/${MYSQL_ROOT_PASSWORD}/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/https:\/\/{WP_HOME}/https:\/\/${DOMAIN_NAME}/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/https:\/\/{WP_SITEURL}/https:\/\/${DOMAIN_NAME}/g" /var/www/wordpress/wp-config.php;

php-fpm7 -F