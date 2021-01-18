FROM    alpine:3.11.7

RUN		mkdir -p /var/lib/mysql /run/mysqld /var/log/mysql

#apk update
RUN		apk update && apk upgrade && \
		apk add mariadb mariadb-client supervisor && \
		apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --allow-untrusted

COPY	telegraf.conf /etc/telegraf/

COPY	my.cnf /etc/mysql

COPY	/scripts/ /scripts/
COPY	database.sql /scripts/
COPY	supervisord.conf /etc/supervisord.conf
RUN		chown -R root:root /var/lib/mysql
RUN		chmod 755 /scripts/*

RUN		rm -rf /var/cache/apk/*

EXPOSE	3306

#launch server
CMD		["/scripts/mysql.sh"]