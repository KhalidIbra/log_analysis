#!/bin/bash

export LOGFILE=nginx-access.log

echo -e "\nTop 5 IP addresses with the most requests"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2, "-", $1, "requests"}'



echo -e "\nTop 5 most requested paths"
awk '{print $7}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2, "-", $1, "requests"}'



echo -e "\nTop 5 response status codes"
awk '{print $9}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2, "-", $1, "requests"}'
