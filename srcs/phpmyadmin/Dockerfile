FROM    alpine:latest

RUN		mkdir -p /run/nginx/ var/www/
RUN		chmod -R 755 var/www/

WORKDIR var/www

#apk update
RUN		apk update && apk upgrade && \
		apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community php nginx supervisor php7-fpm

#copy nginx and supervisor configs
COPY	nginx.conf /etc/nginx/nginx.conf
COPY	nginx.conf /etc/nginx/conf.d/default.conf
COPY	supervisord.conf /etc/supervisord.conf

RUN		wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.4-all-languages.tar.gz && \
		tar zxvf phpMyAdmin-5.0.4-all-languages.tar.gz && rm phpMyAdmin-5.0.4-all-languages.tar.gz && \
		mv phpMyAdmin-5.0.4-all-languages /var/www/phpmyadmin

COPY	phpmyadmin.sh /scripts/phpmyadmin.sh
RUN		chmod 755 /scripts/phpmyadmin.sh

RUN		rm -rf /var/cache/apk/*

EXPOSE	5000

#launch server
CMD		["/scripts/phpmyadmin.sh"]