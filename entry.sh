#!/bin/bash

if [ -f /etc/configured ]; then
  /etc/init.d/apache2 start
  /etc/init.d/mariadb start
  /etc/init.d/memcached start
  /etc/init.d/koha-common start

  koha-plack --enable $LIBRARY
  koha-plack --start $LIBRARY
else

  # Koha basic config
  sed -i 's/DOMAIN=".myDNSname.org"/DOMAIN=""/' /etc/koha/koha-sites.conf
  sed -i 's/INTRAPORT="80"/INTRAPORT="8080"/' /etc/koha/koha-sites.conf
  sed -i 's/INTRASUFFIX="-intra"/INTRASUFFIX=""/' /etc/koha/koha-sites.conf

  # sed -i 's/MEMCACHED_SERVERS="127.0.0.1:11211"/"MEMCACHED_SERVERS="koha-memcached:11211"/g' /etc/koha/koha-sites.conf

  # Apache2
  a2dismod mpm_event
  a2enmod mpm_prefork rewrite suexec cgi headers proxy_http

  grep -qxF 'Listen 8080' /etc/apache2/ports.conf || echo "Listen 8080" >> /etc/apache2/ports.conf
  grep -qxF 'ServerName 127.0.0.1' /etc/apache2/apache2.conf || echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

  a2dissite 000-default
  rm -R /var/www/html/

  /etc/init.d/apache2 reload
  /etc/init.d/apache2 restart


  /etc/init.d/mariadb start
  /etc/init.d/memcached start
  koha-translate --install sv-SE

  sleep 5

  # koha-create --create-db $LIBRARY --dbhost mariadb
  koha-create --create-db $LIBRARY

  # koha-zebra --start $LIBRARY

  # koha-plack --enable $LIBRARY
  # koha-plack --start $LIBRARY

  # /etc/init.d/apache2 restart

  # Security tweak Mariadb
  mysqladmin -u root password pwd
  mysqladmin -u root -ppwd reload

  echo "Username: $(xmlstarlet sel -t -v 'yazgfs/config/user' /etc/koha/sites/$LIBRARY/koha-conf.xml)"
  echo "Password: $(xmlstarlet sel -t -v 'yazgfs/config/pass' /etc/koha/sites/$LIBRARY/koha-conf.xml)"
  date > /etc/configured
fi

/bin/bash
