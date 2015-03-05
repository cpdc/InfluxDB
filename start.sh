#!/bin/bash

# current data storage path should have write permission
if [ ! -d "/opt/influxdb/shared/data" ]; then 
  mkdir -p /opt/influxdb/shared/data/ 
fi

chmod o+w /opt/influxdb/shared/data/

/etc/init.d/influxdb start
/usr/sbin/nginx -c /etc/nginx/nginx.conf

export LOCAL_IP=`ip addr | grep "eno1" | grep "inet" | cut -f 1 -d "/"|cut -f 6 -d " "`
sed -i "s/localhost/$LOCAL_IP/g" grafana-1.9.1/config.js

# both influxdb and nginx run in daemon, such that we have to block the current terminal to avoid exit
sleep 100000d
