FROM    alpine:latest

#apk update
RUN		apk update && apk upgrade && \
		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_static_linux_amd64.tar.gz && \
		tar xvzf telegraf-1.16.1_static_linux_amd64.tar.gz

COPY	telegraf.sh /scripts/telegraf.sh
RUN		chmod 755 /scripts/telegraf.sh

RUN		rm -rf /var/cache/apk/*

EXPOSE	8086

#launch server
CMD		["/scripts/telegraf.sh"]