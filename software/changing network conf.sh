#! /bin/bash

# Get the current IP address and MAC address
old_ip=$(ip addr show dev eth0 | awk '/inet / {print $2}')
old_mac=$(cat /sys/class/net/eth0/address)

echo "Current IP address: $old_ip"
echo "Current MAC address: $old_mac"

# Generate new IP address and MAC address
new_ip="192.168.$((RANDOM % 256)).$((RANDOM % 256))"
new_mac=$(printf '02:%02X:%02X:%02X:%02X:%02X\n' $((RANDOM & 0xFE)) $((RANDOM)) $((RANDOM)) $((RANDOM)) $((RANDOM)) )

# Save old IP and MAC addresses to file on desktop
echo "Old IP address: $old_ip" > ~/Desktop/network_info.txt
echo "Old MAC address: $old_mac" >> ~/Desktop/network_info.txt

# Change the IP address and MAC address
sudo ifconfig eth0 down
sudo ifconfig eth0 hw ether $new_mac
sudo ifconfig eth0 $new_ip netmask 255.255.255.0
sudo ifconfig eth0 up

# Get the new IP address and MAC address
new_ip=$(ip addr show dev eth0 | awk '/inet / {print $2}')
new_mac=$(cat /sys/class/net/eth0/address)

echo "New IP address: $new_ip"
echo "New MAC address: $new_mac"
