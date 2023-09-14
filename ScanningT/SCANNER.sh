#! /bin/bash
 

echo "The first IP  "
read first_ip
echo "the second IP "
read second_ip
echo "specify the wanted port "
read port
echo "---- Initializing ----"
sleep 2
nmap $first_ip $second_ip -p $port

