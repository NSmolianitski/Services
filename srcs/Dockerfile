FROM    alpine:3.11.7

#apk update
RUN		apk update && apk upgrade && \
		apk add nginx openssl openssh supervisor && \
		apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --allow-untrusted

COPY	nginx/telegraf.conf /etc/telegraf/
RUN		mkdir -p /run/nginx

#copy nginx config
COPY	nginx/nginx.conf /etc/nginx/nginx.conf
#copy supervisor config
COPY	nginx/supervisord.conf /etc/supervisord.conf

#copy ssl key and cert
COPY	ssl/nginx-selfsigned.key /etc/ssl/nginx-selfsigned.key
COPY	ssl/nginx-selfsigned.crt /etc/ssl/nginx-selfsigned.crt

COPY	id_rsa.pub /etc/ssh/ssh_host_rsa_key.pub
COPY	id_rsa /etc/ssh/ssh_host_rsa_key
RUN		mkdir -p .ssh
COPY	id_rsa.pub /.ssh/authorized_keys

COPY	nginx/nginx.sh /scripts/nginx.sh
RUN		chmod 755 /scripts/nginx.sh

RUN		echo "root:root" | chpasswd

RUN		echo "PermitRootLogin yes" >> etc/ssh/sshd_config

RUN		rm -rf /var/cache/apk/*

EXPOSE	80 443 22

#launch server
CMD		["scripts/nginx.sh"]
