FROM    alpine:latest

RUN		mkdir -p /run/nginx /var/www /var/run/php && \
		chmod -R 755 /var/*

WORKDIR /var/www

#apk update
RUN		apk update && apk upgrade && \
		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session nginx supervisor

#copy nginx and supervisor configs
COPY	nginx.conf /etc/nginx/nginx.conf
COPY	nginx.conf /etc/nginx/conf.d/default.conf
COPY	nginx.conf /etc/nginx/sites-available/default
COPY	supervisord.conf /etc/supervisord.conf
COPY	php-fpm.conf /etc/php7
#COPY	www.conf /etc/php7/php-fpm.d

RUN		wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.4-all-languages.tar.gz && \
		tar zxvf phpMyAdmin-5.0.4-all-languages.tar.gz && rm phpMyAdmin-5.0.4-all-languages.tar.gz && \
		mv phpMyAdmin-5.0.4-all-languages /var/www/phpmyadmin

#RUN		mkdir -p /var/www/phpmyadmin/tmp/
#RUN		chmod 755 /var/www/phpmyadmin/*
COPY	config.inc.php /var/www/phpmyadmin/config.inc.php
COPY	phpmyadmin.sh /scripts/phpmyadmin.sh
RUN		chmod 755 /scripts/phpmyadmin.sh
#RUN		chown nginx:nginx *

RUN		rm -rf /var/cache/apk/*

EXPOSE	5000

#launch server
CMD		["/scripts/phpmyadmin.sh"]