FROM    alpine:latest

#apk update
RUN		apk update && apk upgrade && apk add rsync influxdb supervisor && \
		apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --allow-untrusted

COPY	telegraf.conf /etc/telegraf/
COPY	influxdb.sh /scripts/influxdb.sh
COPY	supervisord.conf /etc/supervisord.conf
RUN		chmod 755 /scripts/influxdb.sh

RUN		rm -rf /var/cache/apk/*

EXPOSE	8086

#launch server
CMD		["/scripts/influxdb.sh"]