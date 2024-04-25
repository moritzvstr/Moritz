#!bin/bash



time1=$(date +%s)

sleep $1

time2=$(date +%s)
time_elapsed=$(($time2 - $time1))

echo $time_elapsed  >> testfile.txt