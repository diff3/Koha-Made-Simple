#!/bin/sh

mariadb -u $DB_ADMIN_USER -p$DB_ADMIN_PASS -e "CREATE DATABASE $DB_NAME"
mariadb -u $DB_ADMIN_USER -p$DB_ADMIN_PASS -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mariadb -u $DB_ADMIN_USER -p$DB_ADMIN_PASS -e "grant all privileges on $DB_NAME.* TO '$DB_USER'@'%' identified by '$DB_PASS'";
mariadb -u $DB_ADMIN_USER -p$DB_ADMIN_PASS -e "FLUSH PRIVILEGES";
