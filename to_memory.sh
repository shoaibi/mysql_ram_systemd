#!/bin/sh
source /root/scripts/must_be_root.sh

touch /tmp/to_memory.started
echo "Started " $0

if [ -L /var/lib/mysql ]
then
    echo "/var/lib/mysql is already in ram"
    exit 0
fi

echo "We need to move it to ram"

if [ ! -s /var/lib/mysql.backup ]
then
    echo "Creating backup of current data dir"
    cp -pRL /var/lib/mysql /var/lib/mysql.backup
fi
echo "Copying data dir to ram"
cp -arf /var/lib/mysql /dev/shm/mysql
echo "Removing data dir"
rm -rf /var/lib/mysql
echo "Setting permissions on dir inside ram"
chown -R mysql:mysql /dev/shm/mysql
echo "Creating symlink from data dir to dir inside ram"
ln -s /dev/shm/mysql /var/lib/mysql
echo "Fixing permissions on symlink"
chown -h mysql:mysql /var/lib/mysql
echo "All done"
exit 0
