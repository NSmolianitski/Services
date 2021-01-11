FROM    alpine:latest

#apk update
RUN		apk update && apk upgrade && wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz && \
		tar -zxvf grafana-7.3.6.linux-amd64.tar.gz && \
		wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk && \
        apk add glibc-2.32-r0.apk && rm -rf grafana-7.3.6.linux-amd64.tar.gz && \
        mv grafana-7.3.6 grafana

WORKDIR	/grafana/bin/

COPY	grafana.sh /scripts/grafana.sh
RUN		chmod 755 /scripts/grafana.sh

RUN		rm -rf /var/cache/apk/*

EXPOSE	3000

#launch server
CMD		["/scripts/grafana.sh"]