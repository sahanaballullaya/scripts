#!/bin/bash

# check_logs.sh
# Scan log file for ERROR, FATAL, Exception

LOGFILE=$1

if [ -z "$LOGFILE" ]; then
  echo "Usage: ./check_logs.sh <logfile>"
  exit 1
fi

echo "Scanning $LOGFILE for errors..."

grep -iE "ERROR|FATAL|Exception" $LOGFILE

echo ""
echo "Total matches:"
grep -iE "ERROR|FATAL|Exception" $LOGFILE | wc -l
