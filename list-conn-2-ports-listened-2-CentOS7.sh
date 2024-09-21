#!/bin/bash

# Script that lists active connections to network ports 
# that are listened to. UDP and TCP. Applicable to RH 8/9 compat.

# Get list of TCP ports being listened to
TCP_PORTS=`netstat -tln | awk '{print $4}' | tail -n +2 | grep -oE '[^:]+$' | sort -u`

# Get list of UDP ports being listened to
UDP_PORTS=`netstat -uln | awk '{print $4}' | tail -n +2 | grep -oE '[^:]+$' | sort -u`

# List active connections to listened TCP ports
for PORT in $TCP_PORTS
do
    echo "Connections to TCP port $PORT:"
    ss -tn | grep ":$PORT " | awk {'print $5'}
    echo
done

# List active connections to listened UDP ports
for PORT in $UDP_PORTS
do
    echo "Connections to UDP port $PORT:"
    ss -un | grep ":$PORT " | awk {'print $5'}
    echo
done
