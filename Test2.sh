#!/bin/bash

atimes=(1 2 3 4 5)


for t in ${atimes[@]}
    do
        srun -c 1 sh Test1.sh $t                     
done