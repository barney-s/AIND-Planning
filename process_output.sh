#!/bin/bash
datafile=$1.csv
echo "problem,search,expansions,tests,new nodes,plan length,time" > $datafile
for p in 1 2 3; do
  for s in 1 2 3 4 5; do
     echo -n $p,$s, >> $datafile
     op1=$(cat output/op-$p-$s.txt  | grep -1 Expansions | tail -n 1 | awk '{ print $1"," $2"," $3}')
     op2=$(cat output/op-$p-$s.txt  | grep Plan  | awk '{ print $3","$8 }')
     if [ -z "$op1" ]; then
         echo 0,0,0,0,0.0 >> $datafile
     else
         echo $op1,$op2 >> $datafile
     fi
  done
done
  
