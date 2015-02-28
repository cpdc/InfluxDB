# VERSION:	0.1
# AUTHOR:	Qiang He
# DESCRIPTION:	the DB for walle-monitor

# all service running on mesos should be inherited from mesos-executor
FROM cpdc/matrix-executor 
MAINTAINER Qiang He <qiang.he@chinacache.com>

# install InfluxDB 
RUN wget http://s3.amazonaws.com/influxdb/influxdb-latest-1.x86_64.rpm
RUN sudo rpm -ivh influxdb-latest-1.x86_64.rpm

