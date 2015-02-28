#!/bin/bash

# current data storage path should have write permission
if [ ! -d "/opt/influxdb/shared/data" ]; then 
  mkdir -p /opt/influxdb/shared/data/ 
fi

chmod o+w /opt/influxdb/shared/data/

/etc/init.d/influxdb start
/usr/sbin/nginx -c /etc/nginx/nginx.conf

# both influxdb and nginx run in daemon, such that we have to block the current terminal to avoid exit
sleep 100000d
