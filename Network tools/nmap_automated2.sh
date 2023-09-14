#!/bin/bash

# Prompt for the IP address
read -p "Enter the IP address to scan: " ip_address

# Prompt for the type of scan
echo "Select the type of scan:"
echo "1. TCP SYN scan (-sS): This scan is the most common and efficient. It detects open ports by sending TCP SYN packets."
echo "2. TCP Connect scan (-sT): This scan establishes a full TCP connection to the target ports to determine openness."
echo "3. UDP scan (-sU): This scan checks for open UDP ports by sending UDP packets to various ports."
echo "4. Comprehensive scan (-p-): This scan scans all 65535 ports on the target system for a thorough analysis."
echo "5. Service version detection (-sV): This scan attempts to identify the versions of services running on open ports."

# Read the user's choice
read -p "Enter the scan type number: " scan_choice

# Map the user's choice to the corresponding scan type
case $scan_choice in
  1)
    scan_type="-sS"
    scan_description="TCP SYN scan"
    ;;
  2)
    scan_type="-sT"
    scan_description="TCP Connect scan"
    ;;
  3)
    scan_type="-sU"
    scan_description="UDP scan"
    ;;
  4)
    scan_type="-p-"
    scan_description="Comprehensive scan"
    ;;
  5)
    scan_type="-sV"
    scan_description="Service version detection"
    ;;
  *)
    echo "Invalid scan type selected."
    exit 1
    ;;
esac

# Generate a timestamp for the output file
timestamp=$(date +"%Y%m%d%H%M%S")

# Set the output file path
output_file="scan_results_${ip_address}_${timestamp}.txt"

# Run the initial Nmap scan
nmap $scan_type $ip_address -oN $output_file

# Check if the initial scan result shows filtered ports or is blocked
if grep -qE "filtered|blocked" $output_file; then
  echo "The initial scan showed filtered ports or was blocked."

  # Suggest an alternative scan method
  alternative_scan_type="-f"
  alternative_scan_description="Fragmentation scan"

  echo "It is recommended to try an alternative scan method: $alternative_scan_description (-f)."

  # Run the alternative Nmap scan
  alternative_output_file="scan_results_${ip_address}_${timestamp}_alternative.txt"
  nmap $alternative_scan_type $ip_address -oN $alternative_output_file

  echo "Alternative scan completed. Results saved to: $alternative_output_file"
else
  echo "Scan completed. Results saved to: $output_file"
fi
