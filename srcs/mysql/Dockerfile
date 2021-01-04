FROM    alpine:latest

#apk update
RUN		apk update && apk upgrade && \
		apk add mysql mysql-client

COPY	mysql.sh /scripts/mysql.sh
RUN		chmod 755 /scripts/mysql.sh

EXPOSE	5050

#launch server
CMD		["scripts/mysql.sh"]