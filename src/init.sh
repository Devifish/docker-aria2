#!/bin/sh
set -e

UID=`id -u`
GID=`id -g`

echo
echo "UID: $UID GID: $GID"
echo

echo "Setting conf"
touch /data/aria2.session
if [ ! -f /data/aria2.conf ];then
  cp /aria2/default-aria2.conf /data/aria2.conf
fi
if [ ! -d /data/log/ ];then
  mkdir /data/log/
fi
if [ ! -d /data/dht/ ];then
  mkdir /data/dht/
fi

echo "Setting owner and permissions"
chown -R $UID:$GID /data
find /data -type d -exec chmod 755 {} +
find /data -type f -exec chmod 644 {} +

echo "Starting aria2c"
exec aria2c --conf-path=/data/aria2.conf