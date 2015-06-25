#!/bin/sh
#Check if run as root
if [ `whoami` != root ]
then
    echo "You must be root to do that!"
    exit 1
fi

if [ -L /var/lib/mysql ]
then
    echo "Mem db"
    exit 0
else
    echo "File db"
    exit 1
fi
