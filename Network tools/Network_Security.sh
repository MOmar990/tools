#!/bin/bash

# Define your IP address
YOUR_IP=192.168.1.13

# Function to check for scans
check_for_scans() {
    while true; do
        # Use tcpdump to capture incoming packets
        # Adjust the filter to match your IP address and port(s) of interest
        # This example captures SYN packets
        scan_detected=$(sudo tcpdump -i eth0 -n -l "src $YOUR_IP and tcp[tcpflags] & (tcp-syn) != 0" 2>/dev/null)

        if [ -n "$scan_detected" ]; then
            # Send an alert message
            echo "Scan detected on $YOUR_IP"
            # You could use other methods to alert yourself, such as sending an email or a notification
            # For demonstration purposes, let's use a simple echo
            echo "ALERT: Scan detected on $YOUR_IP" >> scan_alert.log
        fi
    done
}

# Run the check_for_scans function in the background
check_for_scans &
