# VERSION:	0.1
# AUTHOR:	Qiang He
# DESCRIPTION:	the DB for walle-monitor

# all service running on mesos should be inherited from mesos-executor
FROM cpdc/matrix-executor 
MAINTAINER Qiang He <qiang.he@chinacache.com>

# install InfluxDB 
RUN wget http://s3.amazonaws.com/influxdb/influxdb-latest-1.x86_64.rpm
RUN rpm -ivh influxdb-latest-1.x86_64.rpm

# modified the maximum file handle
RUN echo "* soft nofile 65535" >> /etc/security/limits.conf
RUN echo "* hard nofile 65535" >> /etc/security/limits.conf

# nginx
RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum install -y nginx

# grafana
RUN wget http://grafanarel.s3.amazonaws.com/grafana-1.9.1.tar.gz
RUN yum install -y tar
RUN tar xzvf grafana-1.9.1.tar.gz

# use custom configuration
ADD ./grafana.config.js /grafana-1.9.1/config.js
ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./influxdb.config.toml /opt/influxdb/shared/config.toml

# 
RUN export export LOCAL_IP=`ip addr | grep "global eno1" | cut -f 1 -d \"/\"|cut -f 6 -d \" \"`
sed "s/localhost/$LOCAL_IP/g" grafana-1.9.1/config.js

# prebuilt startup script
ADD ./start.sh /start.sh
RUN chmod +x /start.sh
