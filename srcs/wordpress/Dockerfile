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
COPY	../supervisord.conf /etc/supervisord.conf

#generate ssl key and cert
RUN		openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=School21/OU=pkentaur/CN=pkwebsite" \
		-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

EXPOSE	5050

#launch server
CMD		["scripts/server.sh"]