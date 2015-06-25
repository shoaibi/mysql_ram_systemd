#!/bin/sh
#Check if run as root
if [ `whoami` != root ]
then
    echo "You must be root to do that!"
    exit 1
fi

#systemctl stop mysqld
if [ ! -s /var/lib/mysql.backup ]
then
    exit -1
fi
rm /var/lib/mysql
cp -pRL /var/lib/mysql.backup /var/lib/mysql
rm -rf /dev/shm/mysql
#systemctl start mysqld
