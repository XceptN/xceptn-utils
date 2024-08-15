#!/bin/bash

# Shell script to enable and configure firewalld on RH 7 based systems

# Enable and start firewalld
systemctl enable firewalld
systemctl start firewalld

TCP_PORTS=`netstat -tln | awk '{print $4}' | tail -n +3 | grep -oE '[^:]+$' | sort -u`
UDP_PORTS=`netstat -uln | awk '{print $4}' | tail -n +3 | grep -oE '[^:]+$' | sort -u`

# Allow TCP ports
for PORT in $TCP_PORTS
do
    firewall-cmd --zone=public --add-port=$PORT/tcp
done

echo -n "Allowed TCP ports: "
echo $TCP_PORTS

# Allow UDP ports
for PORT in $UDP_PORTS
do
    firewall-cmd --zone=public --add-port=$PORT/udp
done

echo -n "Allowed UDP ports: "
echo $UDP_PORTS

# Make changes permanent
firewall-cmd --runtime-to-permanent

echo "Made FirewallD rules permanent"
echo 
firewall-cmd --list-all