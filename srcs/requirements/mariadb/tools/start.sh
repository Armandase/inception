mkdir -p /var/run/mysql
touch /var/run/mysql/mysql.sock
chmod 777 /var/run/mysql/mysql.sock
mkdir -p /var/lib/mysql
touch /var/lib/mysql/mysql.sock
chmod 777 /var/lib/mysql/mysql.sock

mysql_install_db
mysqld
