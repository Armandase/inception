#!/bin/sh
mysql_install_db --basedir=/volume --datadir=/volume --user=root --rpm > /dev/null

echo "CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME;
GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO $WP_DATABASE_USR IDENTIFIED BY $WP_DATABASE_PWD;
FLUSH PRIVILEGES;" > /database

/usr/bin/mysqld --user=root --bootstrap < /database

rm /database

sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=root --console
