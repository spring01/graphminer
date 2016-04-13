#!/bin/bash

base_name=$1
delim=$2
index_setting=$3
reorder_setting=$4

if [ $index_setting == "src(c)" ]; then
    index_setting_full=" --index idx_src '(src_id DESC)' True "
fi

if [ $index_setting == "dst" ]; then
    index_setting_full=" --index idx_dst '(dst_id DESC)' False "
fi

if [ $index_setting == "dst(c)" ]; then
    index_setting_full=" --index idx_dst '(dst_id DESC)' True "
fi

if [ $index_setting == "src" ]; then
    index_setting_full=" --index idx_src '(src_id DESC)' False "
fi

if [ $index_setting == "src(c)_dst" ]; then
    index_setting_full=" --index idx_src '(src_id DESC)' True --index idx_dst '(dst_id DESC)' False "
fi

if [ $index_setting == "src_dst(c)" ]; then
    index_setting_full=" --index idx_src '(src_id DESC)' False --index idx_dst '(dst_id DESC)' True "
fi

if [ $index_setting == "(dst,src)(c)" ]; then
    index_setting_full=" --index idx_dst '(dst_id DESC, src_id DESC)' True "
fi

if [ $reorder_setting == "random" ]; then
    reorder_setting_full=" --reorder='random DESC' "
fi

if [ $reorder_setting == "pagerank" ]; then
    reorder_setting_full=" --reorder='page_rank DESC' "
fi

if [ $reorder_setting == "slashburn" ]; then
    reorder_setting_full=" --reorder='slashburn DESC' "
fi

for ind in `seq 1 5`; do
    output_name="output/timing/$base_name-$index_setting-$reorder_setting.timing$ind"
    make timing -f makefile.timing base_name="$base_name" delim="'$delim'" index_setting_full="$index_setting_full" reorder_setting_full="$reorder_setting_full" > "$output_name"
done



