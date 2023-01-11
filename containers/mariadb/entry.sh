#!/bin/sh

mysql -h $DB_SERVER -P $DB_PORT -u $DB_ADMIN_USER -p$DB_ADMIN_PASS -e "CREATE DATABASE $DB_NAME"
mysql -h $DB_SERVER -P $DB_PORT -u $DB_ADMIN_USER -p$DB_ADMIN_PASS -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mysql -h $DB_SERVER -P $DB_PORT -u $DB_ADMIN_USER -p$DB_ADMIN_PASS -e "grant all privileges on $DB_NAME.* TO '$DB_USER'@'%' identified by '$DB_PASS'";



