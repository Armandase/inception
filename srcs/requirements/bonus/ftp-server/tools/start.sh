#!/bin/sh

adduser --disabled-password $FTP_NAME
echo "${FTP_NAME}":"${FTP_PWD}" | chpasswd
usermod --home /wordpress $FTP_NAME

echo "$FTP_NAME" > /etc/vsftpd/vsftpd.userlist

chown $FTP_NAME:$FTP_NAME /wordpress

exec vsftpd /etc/vsftpd/vsftpd.conf
