# wordpress and php-fpm

FROM alpine:3.15

RUN			apk update 
WORKDIR 	/root

RUN		apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json \
		php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql \
		php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext \
		php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl \
		php7-ctype php7-session php7-mbstring

RUN		apk add wget tar ;\
		wget https://wordpress.org/wordpress-5.7.tar.gz ;\
		tar -xzvf wordpress-5.7.tar.gz ;\
		rm -rf wordpress-5.7.tar.gz

ADD		wp-config.php www.conf start.sh ./



RUN 	adduser -S -D -s /sbin/nologin -h /var/www -G www-data www-data
RUN		mv wordpress /var/www/ ;\
		mv wp-config.php /var/www/wordpress ;\
		chmod 755 wp-config.php ;\
		mv www.conf /etc/php7/php-fpm.d/www.conf 

EXPOSE  9000

CMD sh start.sh
#CMD php-fpm7 -F
