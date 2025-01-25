#!/bin/bash

read ip
read port
read time

# Validate input
if [[ -z "$ip" || -z "$port" || -z "$time" ]]; then
  echo "Error: Missing IP, Port, or Time"
  exit 1
fi

# Check if binary exists
if [[ ! -f ./binary ]]; then
  echo "Error: ./binary not found"
  exit 1
fi

# Check if binary is executable
if [[ ! -x ./binary ]]; then
  echo "Error: Permission denied for ./binary"
  exit 1
fi

# Run the binary
./binary "$ip" "$port" "$time" || {
  echo "Error: Failed to execute ./binary"
  exit 1
}

echo "Attack executed successfully on $ip:$port for $time seconds"
exit 0
