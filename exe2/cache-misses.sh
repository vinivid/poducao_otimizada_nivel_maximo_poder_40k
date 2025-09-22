for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads-misses:u ./koala 0 0 2>&1 | cut -d, -f1 1>>./cache_load_misses/cachem00.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads-misses:u ./koala 0 1 2>&1 | cut -d, -f1 1>>./cache_load_misses/cachem01.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads-misses:u ./koala 1 0 2>&1 | cut -d, -f1 1>>./cache_load_misses/cache10.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads-misses:u ./koala 1 1 2>&1 | cut -d, -f1 1>>./cache_load_misses/cachem11.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads-misses:u ./koala 2 0 2>&1 | cut -d, -f1 1>>./cache_load_misses/cachem20.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads-misses:u ./koala 2 1 2>&1 | cut -d, -f1 1>>./cache_load_misses/cachem21.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads-misses:u ./koala 3 0 2>&1 | cut -d, -f1 1>>./cache_load_misses/cachem30.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads-misses:u ./koala 3 1 2>&1 | cut -d, -f1 1>>./cache_load_misses/cachem31.dat
done
