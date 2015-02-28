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
RUN tar xzvf grafana-1.9.1.tar.gz
