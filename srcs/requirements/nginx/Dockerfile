# nginx with tls

FROM alpine:3.15

RUN		apk update
WORKDIR	/root

RUN		apk add nginx

ADD		nginx_wp.conf /etc/nginx/http.d
ADD		nginx.conf /etc/nginx/

RUN		apk add openssl ; \ 	
		mkdir /etc/nginx/ssl ; \
		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/nginx/ssl/khermann.key \
		-out /etc/nginx/ssl/khermann.crt \
		-subj "/C=RU/ST=Kazan/L=Kazan/O=Ecole42/OU=School21/CN=khermann"

EXPOSE	443

CMD		nginx -g "daemon off;"
