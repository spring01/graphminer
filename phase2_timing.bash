#!/bin/bash

declare -a index_schemes=("dst(c)" "src(c)_dst" "(dst,src)(c)")
declare -a reorder_schemes=("random" "pagerank" "slashburn")

base_name=soc-Epinions1

wget http://snap.stanford.edu/data/${base_name}.txt.gz
gunzip -f ${base_name}.txt.gz
grep -v "#" ${base_name}.txt > ${base_name}-nosharp.txt

for index in "${index_schemes[@]}"; do
    for reorder in "${reorder_schemes[@]}"; do
        bash util/timing.bash ${base_name} "	" $index $reorder
    done
done

rm ${base_name}-nosharp.txt ${base_name}.txt



