for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 0 0 2>&1 | cut -d, -f1 1>>cache00.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 0 1 2>&1 | cut -d, -f1 1>>cache01.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 1 0 2>&1 | cut -d, -f1 1>>cache10.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 1 1 2>&1 | cut -d, -f1 1>>cache11.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 2 0 2>&1 | cut -d, -f1 1>>cache20.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 2 1 2>&1 | cut -d, -f1 1>>cache21.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 3 0 2>&1 | cut -d, -f1 1>>cache30.dat
done

for i in {1..10}
do
    perf stat -x, -e L1-dcache-loads:u ./koala 3 1 2>&1 | cut -d, -f1 1>>cache31.dat
done
