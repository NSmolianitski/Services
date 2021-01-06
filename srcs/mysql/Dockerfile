FROM    alpine:latest

#apk update
RUN		apk update && apk upgrade && \
		apk add mariadb mariadb-client

#RUN		mkdir /run/mysqld
#create directories
RUN		mkdir -p /var/lib/mysql /run/mysqld
COPY	my.cnf /etc/mysql

#RUN		mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
RUN		mysql_install_db -u root

COPY	mysql.sh /scripts/mysql.sh
RUN		chmod 755 /scripts/mysql.sh

EXPOSE	3306

#launch server
CMD		["scripts/mysql.sh"]