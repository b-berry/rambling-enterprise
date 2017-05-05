#!/bin/bash

# This bash script assums an infile contains one integer per line

INFILE='./int_sample.txt'
SUM=0;

while read LINE; do 
  (( SUM = $SUM + $LINE )); 
done< <(cat $INFILE); 

echo "Sum: $SUM" &&\
echo "Count: $(cat $INFILE | wc -l)"
