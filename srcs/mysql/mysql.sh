#!/usr/bin/env sh



#rm -rf /var/cache/apk/* /etc/my.cnf*


#install and start services

#/usr/bin/mysqld -u root #--console
/usr/bin/mysqld -u root

#avoid container to stop
sleep infinity