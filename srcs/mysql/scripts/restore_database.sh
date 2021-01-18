#!/usr/bin/env sh

rm -rf /var/lib/mysql/*
mysql_install_db -u root
mysqld &
sleep 3
#create database
echo "CREATE DATABASE wordpress_db;" | mysql -u root
mysql -u root wordpress_db < /scripts/database.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "Database created"
mysqladmin -u root shutdown
sleep 3