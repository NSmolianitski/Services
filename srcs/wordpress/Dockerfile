FROM    alpine:latest

#apk update
RUN		apk update && apk upgrade && \
		apk add nginx openssl openssh supervisor

RUN		wget -O wordpress.tar.gz http://wordpress.org/latest.tar.gz && \
		tar -zxvf wordpress.tar.gz && rm -rf wordpress.tar.gz

RUN		mkdir -p /run/nginx

#copy nginx config
COPY	nginx.conf /etc/nginx/nginx.conf
#copy supervisor config
COPY	supervisord.conf /etc/supervisord.conf

#copy ssl key and cert
COPY	ssl/nginx-selfsigned.key /etc/ssl/nginx-selfsigned.key
COPY	ssl/nginx-selfsigned.crt /etc/ssl/nginx-selfsigned.crt

COPY	wordpress.sh /scripts/wordpress.sh
RUN		chmod 755 /scripts/wordpress.sh

EXPOSE	5050

#launch server
CMD		["scripts/wordpress.sh"]