#!/bin/bash

# Shell script to enable and configure firewalld on RHEL based systems

# Enable and start firewalld
systemctl enable firewalld
systemctl start firewalld

TCP_PORTS=`ss -tln | cut --characters=36-40 | grep -v Port | sort -u`
UDP_PORTS=`ss -uln | cut --characters=36-40 | grep -v Port | sort -u`

# Allow TCP ports
for PORT in $TCP_PORTS
do
    firewall-cmd --add-port=$PORT/tcp
done

# Allow UDP ports
for PORT in $UDP_PORTS
do
    firewall-cmd --add-port=$PORT/tcp
done

# Make changes permanent
firewall-cmd --runtime-to-permanent