FROM    alpine:3.11.7

#apk update
RUN		apk update && apk upgrade && wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz && \
		tar -zxvf grafana-7.3.6.linux-amd64.tar.gz && \
		wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk && \
        apk add glibc-2.32-r0.apk && rm -rf grafana-7.3.6.linux-amd64.tar.gz && \
        mv grafana-7.3.6 grafana && \
		apk add supervisor telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --allow-untrusted

COPY	telegraf.conf /etc/telegraf/
COPY	supervisord.conf /etc/supervisord.conf
COPY	grafana.db /grafana/data/grafana.db

WORKDIR	/grafana/bin/

COPY	grafana.sh /scripts/grafana.sh
RUN		chmod 755 /scripts/grafana.sh

RUN		rm -rf /var/cache/apk/*

EXPOSE	3000

#launch server
CMD		["/scripts/grafana.sh"]