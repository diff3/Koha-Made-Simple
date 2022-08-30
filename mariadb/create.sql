CREATE DATABASE koha;
CREATE USER 'koha'@'%' IDENTIFIED BY 'koha';
grant all privileges on koha.* TO 'koha'@'%' identified by 'koha'";
FLUSH PRIVILEGES;
