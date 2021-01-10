#!/usr/bin/env sh

#create database
echo "CREATE DATABASE wordpress_db;" | mysql -u root
mysql -u root wordpress_db < /scripts/database.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "Database created"