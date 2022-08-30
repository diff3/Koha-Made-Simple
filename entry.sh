#!/bin/sh

if [ ! -f /etc/configured ]; then
   # Koha basic config

   sed -i 's/DOMAIN=".myDNSname.org"/DOMAIN=""/' /etc/koha/koha-sites.conf
   sed -i 's/INTRAPORT="80"/INTRAPORT="8080"/' /etc/koha/koha-sites.conf
   sed -i 's/INTRASUFFIX="-intra"/INTRASUFFIX=""/' /etc/koha/koha-sites.conf

   # sed -i 's/MEMCACHED_SERVERS="127.0.0.1:11211"/"MEMCACHED_SERVERS="koha-memcached:11211"/g' /etc/koha/koha-sites.conf

   grep -qxF 'Listen 8080' /etc/apache2/ports.conf || echo "Listen 8080" >> /etc/apache2/ports.conf
   grep -qxF 'ServerName 127.0.0.1' /etc/apache2/apache2.conf || echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

   a2dissite 000-default
   rm -R /var/www/html/

   koha-create --request-db $KOHA_INSTANCE_NAME

   xmlstarlet ed -L -u "yazgfs/config/database" -v $DB_NAME /etc/koha/sites/$KOHA_INSTANCE_NAME/koha-conf.xml
   xmlstarlet ed -L -u "yazgfs/config/hostname" -v $DB_SERVER /etc/koha/sites/$KOHA_INSTANCE_NAME/koha-conf.xml
   xmlstarlet ed -L -u "yazgfs/config/user" -v $DB_USER /etc/koha/sites/$KOHA_INSTANCE_NAME/koha-conf.xml
   xmlstarlet ed -L -u "yazgfs/config/pass" -v $DB_PASS /etc/koha/sites/$KOHA_INSTANCE_NAME/koha-conf.xml
   xmlstarlet ed -L -u "yazgfs/config/port" -v $DB_PORT /etc/koha/sites/$KOHA_INSTANCE_NAME/koha-conf.xml

   koha-create --populate-db $KOHA_INSTANCE_NAME --defaultsql /etc/koha_template.sql --dbhost $DB_SERVER --database $DB_NAME --memcached-prefix $KOHA_INSTANCE_NAME
   koha-translate --install sv-SE

   chown -R $KOHA_INSTANCE_NAME-$KOHA_INSTANCE_NAME:$KOHA_INSTANCE_NAME-$KOHA_INSTANCE_NAME /var/log/koha/$KOHA_INSTANCE_NAME

   koha-enable $KOHA_INSTANCE_NAME
   koha-plack --enable $KOHA_INSTANCE_NAME
   koha-plack --start $KOHA_INSTANCE_NAME

   service apache2 restart
   service memcached restart
   service koha-common restart

   # om man får felmeddelande på timezone kan man använda detta
   # mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql -p

   koha-foreach --chdir --enabled /usr/share/koha/bin/devel/create_superlibrarian.pl --userid $KOHA_INITIAL_ADMIN_NAME --password $KOHA_INITIAL_ADMIN_PASS --branchcode Q --categorycode S --cardnumber 1
   touch /etc/configured
else
   /etc/init.d/apache2 start
   /etc/init.d/memcached start
   /etc/init.d/koha-common start
fi

/bin/bash
