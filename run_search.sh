#!/bin/bash

for p in 1 2 3; do
  for s in 6 7 8 9; do
     echo "running problem $p search $s"
     gtimeout 600 python run_search.py -p $p -s $s > output/op-$p-$s.txt
  done
done
  
