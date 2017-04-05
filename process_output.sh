#!/bin/bash
#    1. breadth_first_search 
#    2. breadth_first_tree_search 
#    3. depth_first_graph_search 
#    4. depth_limited_search 
#    5. uniform_cost_search 
#    6. recursive_best_first_search h_1
#    7. greedy_best_first_graph_search h_1
#    8. astar_search h_1
#    9. astar_search h_ignore_preconditions
#    10. astar_search h_pg_levelsum

datafile=$1.csv
echo "problem,search,expansions,tests,new nodes,plan length,time" > $datafile
for p in 1 2 3; do
  for s in 1 2 3 4 5 6 7 8 9; do
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
  
