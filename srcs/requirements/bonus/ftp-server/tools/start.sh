#!/bin/sh

#create the ftp user with his password
#change his home to shared volume
adduser --disabled-password $FTP_NAME
echo "${FTP_NAME}":"${FTP_PWD}" | chpasswd
usermod --home /wordpress $FTP_NAME

#Add the user to the user list
echo "$FTP_NAME" > /etc/vsftpd/vsftpd.userlist

chown $FTP_NAME:$FTP_NAME /wordpress

#exec vsftpd with the conf file
exec vsftpd /etc/vsftpd/vsftpd.conf
