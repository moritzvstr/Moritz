#!/bin/bash/

index=$2
datadir=$1



gunzip $datadir/$index/*.gz         #unzip file

#GC Content
    gc_count=$(grep -v ">" $datadir/$index/*.fna | sed "s/[AT]//g" | wc -m) #remove header #remove A and T #count G and C
    at_count=$(grep -v ">" $datadir/$index/*.fna | sed "s/[GC]//g" | wc -m)

    tot_count=$(($at_count+$gc_count))
    gc_content=$(echo "scale=5; $gc_count/$tot_count" | bc)

#Sequence Lenght
    #lenght=$(($at_count + $gc_count))
    #lenght=$(wc -m $datadir/$index/*.fna | wc -l)

#Number genes
    ngenes=$(grep -i "gene" $datadir/$index/*.gff | wc -m)

#Phylum name
    id=$(grep -i "##species" $datadir/$index/*.gff | head -n 1 | cut -d"=" -f2)
    phylum=$(docker run --rm ncbi/edirect  /bin/bash -c  "efetch -db taxonomy -id $id -format xml | xtract -pattern Taxon -block '*/Taxon' -tab '\n'  -element Id,Rank,TaxId,ScientificName" | grep "phylum" | cut -f 3)

echo "$2; $tot_count; $ngenes; $gc_content; $phylum" >> results2_bac_xae.csv