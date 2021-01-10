#!/usr/bin/env sh

#save database
mysqldump -u root wordpress_db > /scripts/database.sql
echo "Database saved"