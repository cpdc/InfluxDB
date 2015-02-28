#!/bin/bash

# current data storage path should have write permission
if [ ! -d "/influxdb_data" ]; then 
  mkdir /influxdb_data 
fi

chmod o+w /influxdb_data

/etc/init.d/influxdb start
/usr/sbin/nginx -c /etc/nginx/nginx.conf

# both influxdb and nginx run in daemon, such that we have to block the current terminal to avoid exit
sleep 100000d
