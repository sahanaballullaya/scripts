#!/bin/bash

DISK_THRESHOLD=80

echo "Checking all filesystem usage..."

df -h | grep -vE '^Filesystem|tmp' | while read line
do
    usage=$(echo "$line" | awk '{print $5}' | sed 's/%//')
    mount=$(echo "$line" | awk '{print $6}')

    if [ "$usage" -gt "$DISK_THRESHOLD" ]; then
        echo "ALERT: $mount is ${usage}% full"
    else
        echo "$mount OK: ${usage}%"
    fi
done
