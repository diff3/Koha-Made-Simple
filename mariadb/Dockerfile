FROM mariadb:latest

COPY entry.sh /entry.sh
# COPY fix.sh /docker-entrypoint-initdb.d/1.fix.sh
COPY 2.create.sql /docker-entrypoint-initdb.d/create.sql
RUN chmod +x /entry.sh
