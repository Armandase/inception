#!/bin/sh

useradd -m $FTP_NAME
usermod --password $FTP_PWD $FTP_NAME

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
