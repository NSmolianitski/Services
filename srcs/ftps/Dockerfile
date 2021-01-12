FROM    alpine:latest

#apk update
RUN		apk update && apk upgrade && \
		apk add supervisor telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --allow-untrusted \
		vsftpd pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing --allow-untrusted

COPY	telegraf.conf /etc/telegraf/
COPY	supervisord.conf /etc/supervisord.conf

#copy ssl key and cert
COPY	./ssl/selfsigned.key /etc/ssl/private/vsftpd.key
COPY	./ssl/selfsigned.crt /etc/ssl/certs/vsftpd.crt

COPY	vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY	ftps.sh /scripts/ftps.sh
RUN		chmod 755 /scripts/ftps.sh && \
		echo "root:root" | chpasswd

RUN		rm -rf /var/cache/apk/*

EXPOSE	21

#launch server
CMD		["/scripts/ftps.sh"]