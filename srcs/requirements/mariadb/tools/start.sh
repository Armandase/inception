#!/bin/sh

echo "CREATE DATABASE IF NOT EXISTS ${WP_DATABASE_NAME};
CREATE USER IF NOT EXISTS '${WP_DATABASE_USR}'@'%';
SET PASSWORD FOR '${WP_DATABASE_USR}'@'%' = PASSWORD('${WP_DATABASE_PWD}');
GRANT ALL PRIVILEGES ON ${WP_DATABASE_NAME}.* TO '${WP_DATABASE_USR}'@'%';
FLUSH PRIVILEGES;" > /init.sql

exec /usr/bin/mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/init.sql
