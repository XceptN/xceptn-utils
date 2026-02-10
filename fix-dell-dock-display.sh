#!/bin/bash
# Fix dock DisplayPort detection by rebinding Thunderbolt NHI
echo "Rebinding Thunderbolt NHI controller..."
echo "0000:00:0d.2" > /sys/bus/pci/drivers/thunderbolt/unbind
sleep 3
echo "0000:00:0d.2" > /sys/bus/pci/drivers/thunderbolt/bind
sleep 2
echo "Display status after rebind:"
for c in /sys/class/drm/card1-DP-*/status; do
    echo "  $(basename $(dirname $c)): $(cat $c)"
done
