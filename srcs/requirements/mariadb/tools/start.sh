mkdir -p /var/run/mysql
touch /var/run/mysql/mysql.sock
chmod 777 /var/run/mysql/mysql.sock

mysql_install_db
mysqld -u root
