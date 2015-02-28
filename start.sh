#!/bin/bash

/etc/init.d/influxdb start
/usr/sbin/nginx -c /etc/nginx/nginx.conf
