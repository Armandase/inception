#!/bin/sh
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=root --rpm > /dev/null

echo "CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME;
GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO 'database_user'@'%' IDENTIFIED BY 'database_pwd';
FLUSH PRIVILEGES;" > /database
sed -i "s|database_user|$WP_DATABASE_USR|g" /database
sed -i "s|database_pwd|$WP_DATABASE_PWD|g" /database
/usr/bin/mysqld --user=root --init-file=/database

rm /database

sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=root --console
