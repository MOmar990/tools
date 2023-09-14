#!/bin/bash
sudo -i
# Prompt for the IP address
read -p "Enter the IP address to scan: " ip_address

# Prompt for the type of scan
echo "Select the type of scan:"
echo "1. TCP SYN scan (-sS)"
echo "2. TCP Connect scan (-sT)"
echo "3. UDP scan (-sU)"
echo "4. Comprehensive scan (-p-)"
echo "5. Service version detection (-sV)"

# Read the user's choice
read -p "Enter the scan type number: " scan_choice

# Map the user's choice to the corresponding scan type
case $scan_choice in
  1)
    scan_type="-sS"
    ;;
  2)
    scan_type="-sT"
    ;;
  3)
    scan_type="-sU"
    ;;
  4)
    scan_type="-p-"
    ;;
  5)
    scan_type="-sV"
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

# Run the Nmap scan
nmap $scan_type $ip_address -oN $output_file

echo "Scan completed. Results saved to: $output_file"
