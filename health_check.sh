#!/bin/bash
echo "==============================="
echo "     SERVER HEALTH CHECK      "
echo "==============================="

echo
echo "HOSTNAME:"
hostname

echo "Current Date: "
Date

echo
echo "Uptime: "
Uptime

echo 
echo "Disk Usage:"
df -h

echo
echo "Memory Usage:"
free -h

echo
echo "CPU Load:"
Uptime  awk -F'load average:' '{print $2 }'

echo
echo "=============================="
echo "   HEALTH CHECK COMPLETED.     "
echo "=============================="
