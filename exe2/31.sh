for i in {1..10}
do
    perf stat -x, -e branch-misses:u ./koala 3 1 2>&1 | cut -d , -f 1 1>>./branch_misses/braches31.data
done

for i in {1..10}
do
    perf stat -x, -e branches:u ./koala 3 1 2>&1 | cut -d , -f 1 1>>braches31.data
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 3 1 2>&1 | cut -d, -f1 1>>./cache_load/cache31.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads-misses:u ./koala 3 1 2>&1 | cut -d, -f1 1>>./cache_load_misses/cachem31.dat
done