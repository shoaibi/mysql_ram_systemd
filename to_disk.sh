#!/bin/sh
source /root/scripts/must_be_root.sh

touch /tmp/to_disk.started
echo "Started " $0
if [ -L /var/lib/mysql ]
then

	echo "Removing data dir"
	rm /var/lib/mysql
	echo "Checking if dir inside ram exists"
	if [ ! -s /dev/shm/mysql ]
	then
	    echo "It didn't exist. Restoring from backup"
	    cp -pRL /var/lib/mysql.backup /var/lib/mysql
	else
	    echo "it did exist. Moving it"
	    mv /dev/shm/mysql /var/lib/mysql
	fi
else
	echo "Its already on disk"
fi
echo "All Done"

exit 0
