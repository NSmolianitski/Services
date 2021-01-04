FROM    alpine:latest

#apk update
RUN		apk update && apk upgrade && \
		apk add nginx openssl openssh supervisor

RUN		mkdir -p /run/nginx

#copy nginx config
COPY	srcs/nginx/nginx.conf /etc/nginx/nginx.conf
#copy supervisor config
COPY	srcs/nginx/supervisord.conf /etc/supervisord.conf

#copy ssl key and cert
COPY	srcs/ssl/nginx-selfsigned.key /etc/ssl/nginx-selfsigned.key
COPY	srcs/ssl/nginx-selfsigned.crt /etc/ssl/nginx-selfsigned.crt

COPY	srcs/nginx/nginx.sh /scripts/nginx.sh
RUN		chmod 755 /scripts/nginx.sh

EXPOSE	80 443 22

#launch server
CMD		["scripts/nginx.sh"]