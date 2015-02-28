#!/bin/bash

# current data storage path should have write permission
chmod o+w /influxdb_data/

/etc/init.d/influxdb start
/usr/sbin/nginx -c /etc/nginx/nginx.conf
