#!/bin/bash

disk_name="md0"

awk 'BEGIN {print "cpu usage\n"; i=0};$1 ~ /[0-9]+\.[0-9]+/ {print i,$1+$3;i+=1;}' 20-xp.iostat-cdm.out > 20-xp.iostat-cdm-cpu.out
# awk 'BEGIN {print "sdb info\nTime IOPS RMBpsWMBps"; i=0};$1 ~ /^md0/ {iops=$4+$5;print i,iops,$6,$7;i+=1;}' 20-xp.iostat-cdm.out > 20-xp.iostat-cdm-md0.out
# awk 'BEGIN {printf "md0 info\n%-15s %-15s %-15s %s\n","Time","IOPS","RMBps","WMBps"; i=0};$1 ~ /^md0/ {iops=$4+$5;printf "%-15s %-15s %-15s %s\n",i,iops,$6,$7;i+=1;}' 20-xp.iostat-cdm.out > 20-xp.iostat-cdm-md0.out
awk 'BEGIN {printf "'${disk_name}' info\n%-15s %-15s %-15s %s\n","Time","IOPS","RMBps","WMBps"; i=0};$1 ~ /^'${disk_name}'/ {iops=$4+$5;printf "%-15s %-15s %-15s %s\n",i,iops,$6,$7;i+=1;}' 20-xp.iostat-cdm.out > 20-xp.iostat-cdm-${disk_name}.out
