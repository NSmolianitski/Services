FROM    alpine:latest

#apk update
RUN		apk update && apk upgrade && \
		apk add mariadb mariadb-client supervisor
#		apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --allow-untrusted
#
#COPY	telegraf.conf /etc/telegraf/

RUN		mkdir -p /var/lib/mysql /run/mysqld
COPY	my.cnf /etc/mysql

COPY	/scripts/ /scripts/
COPY	database.sql /scripts/
COPY	supervisord.conf /etc/supervisord.conf
RUN		chmod 755 /scripts/*

RUN		rm -rf /var/cache/apk/*

EXPOSE	3306

#launch server
CMD		["/scripts/mysql.sh"]