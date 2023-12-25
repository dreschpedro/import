#!/bin/bash

# Prints the IP of the specified interface or default interface if not specified
# Example usage: 
# Option 1 - Specify interface --> /home/username/ip_widget.sh eth0 🟢
# Option 2 - Use default interface --> /home/username/ip_widget.sh
# It can be used to echo interface IP in xfce-genmon4 widgets (kali)

# Set the default interface (change 'eth0' to your desired default interface)
DEFAULT_INTERFACE="eth0"

INTERFACE=$1

if [ -z "$INTERFACE" ]; then
  INTERFACE=$DEFAULT_INTERFACE
fi

IP_ADDRESS=$(ip -4 addr show $INTERFACE | awk '/inet/ {print $2}' | cut -d'/' -f1)

if [ -n "$IP_ADDRESS" ]; then
  echo $IP_ADDRESS
else
  echo "Interface $INTERFACE is down or not found"
fi
