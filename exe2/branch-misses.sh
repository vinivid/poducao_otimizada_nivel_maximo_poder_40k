for i in {1..10}
do
    perf stat -x, -e branch-misses:u ./koala 0 0 2>&1 | cut -d , -f 1 1>>./branch_misses/braches00.data
done

for i in {1..10}
do
    perf stat -x, -e branch-misses:u ./koala 0 1 2>&1 | cut -d , -f 1 1>>./branch_misses/braches01.data
done

for i in {1..10}
do
    perf stat -x, -e branch-misses:u ./koala 1 0 2>&1 | cut -d , -f 1 1>>./branch_misses/braches10.data
done

for i in {1..10}
do
    perf stat -x, -e branch-misses:u ./koala 1 1 2>&1 | cut -d , -f 1 1>>./branch_misses/braches11.data
done

for i in {1..10}
do
    perf stat -x, -e branch-misses:u ./koala 2 0 2>&1 | cut -d , -f 1 1>>./branch_misses/braches20.data
done

for i in {1..10}
do
    perf stat -x, -e branch-misses:u ./koala 2 1 2>&1 | cut -d , -f 1 1>>./branch_misses/braches21.data
done

for i in {1..10}
do
    perf stat -x, -e branch-misses:u ./koala 3 0 2>&1 | cut -d , -f 1 1>>./branch_misses/braches30.data
done

for i in {1..10}
do
    perf stat -x, -e branch-misses:u ./koala 3 1 2>&1 | cut -d , -f 1 1>>./branch_misses/braches31.data
done
