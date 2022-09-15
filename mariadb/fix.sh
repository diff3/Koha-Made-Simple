#!/bin/bash

cat << 'EOF' >> /docker-entrypoint-initdb.d/2.create.sql
CREATE DATABASE koha;
CREATE USER 'user'@'%' IDENTIFIED BY 'koha';
grant all privileges on koha.* TO 'user'@'%' identified by 'koha';
FLUSH PRIVILEGES;
EOF

sleep 3
