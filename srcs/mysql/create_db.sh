#!/usr/bin/env sh

echo "CREATE DATABASE wordpress_db;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "Database created"
