FROM mariadb:latest

COPY entry.sh /entry.sh
COPY create.sql /docker-entrypoint-initdb.d/
RUN chmod +x /entry.sh
