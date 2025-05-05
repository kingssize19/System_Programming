#!/bin/bash

trap "echo -e '\nScript terminated by user.'; exit 1" SIGINT

echo "Scanning the network, please wait..."

for ip in $(seq 100 200); do
	if ping -c1 -W1 10.62.2.$ip > /dev/null; then
		echo "In use    : 10.62.2.$ip"
	else
		echo "Available : 10.62.2.$ip"
	fi
done
