#!bin/bash

#nthreads= $1
#nseq= $2
#dbsize= $3




time1=$(date +%s)   #timepoint before search starts

vsearch --usearch_global /LETHE/COURSES/HPC24SS/AliScale/query/$2 --db /LETHE/COURSES/HPC24SS/AliScale/references/$3 --id 0.7 --uc test --threads $1    

    #global search of query sequences in the databases

time2=$(date +%s)   #timepoint after search is done
time_elapsed=$(($time2 - $time1))  #calculates time the search takes by substracting time point after and before

echo "$time_elapsed; $1; $2; $3" >> results.txt     #safes resulting time and parameters in text file
