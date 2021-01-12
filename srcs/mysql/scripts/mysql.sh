#!/usr/bin/env sh

#install mysql
#mysql_install_db -u root

#mysqld &
#sleep 3
#sh /scripts/restore_database.sh
#mysqladmin -u root shutdown

#run supervisord
/usr/bin/supervisord -c /etc/supervisord.conf