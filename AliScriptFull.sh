'''bash

--------------------------------------------------------------------------------------
##AliScript.sh
--------------------------------------------------------------------------------------
#!/bin/bash

anthreads=(1 10)        #number of threads the scrips is using
anseq=$(ls /LETHE/COURSES/HPC24SS/AliScale/query)   #number of sequences that is used, query_1.fa, query_8.fa, query_16.fa contain 1, 8 and 16 sequences respectively
adbsize=$(ls /LETHE/COURSES/HPC24SS/AliScale/references)    #size of database, contains databases of different sizes

rm results.txt      #removes the result file before to prevent wrong data from prior test runs

for dbsize in $adbsize              # for loop iterates through all database sizes, sequence numbers and the number of threads
    do                              # every combination will be calculated
        for nseq in $anseq          
            do
                for nthreads in ${anthreads[@]}    
                    do
                        sleep 1
                        srun -c 10 sh time_alg.sh $nthreads $nseq $dbsize &     #runs the other script that calulates the time it takes to run the alignment
                                
                done
        done
done

---------------------------------------------------------------------------------------
##time_alg.sh
---------------------------------------------------------------------------------------

#nthreads= $1
#nseq= $2
#dbsize= $3



time1=$(date +%s)   #timepoint before search starts

vsearch --usearch_global /LETHE/COURSES/HPC24SS/AliScale/query/$2 --db /LETHE/COURSES/HPC24SS/AliScale/references/$3 -t $1    

    #global search of query sequences in the databases

time2=$(date +%s)   #timepoint after search is done
time_elapsed=($time2 - $time1)  #calculates time the search takes by substracting time point after and before

'''

echo "$time_elapsed; $1; $2; $3" >> results.txt     #safes resulting time and parameters in text file
