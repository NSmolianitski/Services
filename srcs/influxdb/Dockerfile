FROM    alpine:latest

#apk update
RUN		apk update && apk upgrade && \
		wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.3_linux_amd64.tar.gz && \
		tar xvzf influxdb2-2.0.3_linux_amd64.tar.gz && mv influxdb2-2.0.3_linux_amd64 influxdb && \
		rm -rf influxdb2-2.0.3_linux_amd64.tar.gz && \
		cp influxdb/influx /usr/local/bin/ && cp influxdb/influxd /usr/local/bin/

COPY	influxdb.sh /scripts/influxdb.sh
COPY	.influxdbv2 /root/.influxdbv2
RUN		chmod 755 /scripts/influxdb.sh

RUN		rm -rf /var/cache/apk/*

EXPOSE	8086

#launch server
CMD		["/scripts/influxdb.sh"]