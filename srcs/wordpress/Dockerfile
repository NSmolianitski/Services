FROM    alpine:latest

RUN		mkdir -p /run/nginx /var/www /var/run/php && \
		chmod -R 755 /var/*

WORKDIR /var/www

#apk update
RUN		apk update && apk upgrade && \
		apk add nginx openssl openssh supervisor php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl \
		php7-mbstring php7-json php7-session nginx supervisor

#copy nginx and supervisor configs
COPY	nginx.conf /etc/nginx/nginx.conf
COPY	nginx.conf /etc/nginx/conf.d/default.conf
COPY	nginx.conf /etc/nginx/sites-available/default
COPY	supervisord.conf /etc/supervisord.conf
COPY	php-fpm.conf /etc/php7

RUN		wget -O wordpress.tar.gz http://wordpress.org/latest.tar.gz && \
		tar -zxvf wordpress.tar.gz && rm -rf wordpress.tar.gz

#copy ssl key and cert
COPY	ssl/nginx-selfsigned.key /etc/ssl/nginx-selfsigned.key
COPY	ssl/nginx-selfsigned.crt /etc/ssl/nginx-selfsigned.crt

COPY	wp-config.php /var/www/wordpress
COPY	wordpress.sh /scripts/wordpress.sh
RUN		chmod 755 /scripts/wordpress.sh

RUN		rm -rf /var/cache/apk/*

EXPOSE	5050

#launch server
CMD		["/scripts/wordpress.sh"]