FROM    alpine:latest

#apk update
RUN		apk update && apk upgrade && \
		apk add nginx openssl openssh supervisor

RUN		mkdir -p /run/nginx

#copy nginx config
COPY	srcs/nginx/nginx.conf /etc/nginx/nginx.conf
#copy supervisor config
COPY	srcs/supervisord.conf /etc/supervisord.conf

#generate ssl key and cert
RUN		openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=School21/OU=pkentaur/CN=pkwebsite" \
		-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

COPY	server.sh /scripts/server.sh
RUN		chmod 755 /scripts/server.sh

EXPOSE	80 443 22

#launch server
CMD		["scripts/server.sh"]