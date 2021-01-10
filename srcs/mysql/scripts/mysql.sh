#!/usr/bin/env sh

#install mysql
mysql_install_db -u root

mysqld &
sleep 3
sh /scripts/resore_database.sh
rm -f /scripts/resore_database.sh
mysqladmin -u root shutdown

#run supervisord
/usr/bin/supervisord -c /etc/supervisord.conf