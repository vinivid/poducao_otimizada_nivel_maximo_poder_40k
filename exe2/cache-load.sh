for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 0 0 2>&1 | cut -d, -f1 1>>./cache_load/cache00.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 0 1 2>&1 | cut -d, -f1 1>>./cache_load/cache01.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 1 0 2>&1 | cut -d, -f1 1>>./cache_load/cache10.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 1 1 2>&1 | cut -d, -f1 1>>./cache_load/cache11.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 2 0 2>&1 | cut -d, -f1 1>>./cache_load/cache20.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 2 1 2>&1 | cut -d, -f1 1>>./cache_load/cache21.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 3 0 2>&1 | cut -d, -f1 1>>./cache_load/cache30.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 3 1 2>&1 | cut -d, -f1 1>>./cache_load/cache31.dat
done
