for i in {1..10}
do
    perf stat -x, -e branches:u ./koala 0 0 2>&1 | cut -d , -f 1 1>>braches00.data
done

for i in {1..10}
do
    perf stat -x, -e branches:u ./koala 0 1 2>&1 | cut -d , -f 1 1>>braches01.data
done

for i in {1..10}
do
    perf stat -x, -e branches:u ./koala 1 0 2>&1 | cut -d , -f 1 1>>braches10.data
done

for i in {1..10}
do
    perf stat -x, -e branches:u ./koala 1 1 2>&1 | cut -d , -f 1 1>>braches11.data
done

for i in {1..10}
do
    perf stat -x, -e branches:u ./koala 2 0 2>&1 | cut -d , -f 1 1>>braches20.data
done

for i in {1..10}
do
    perf stat -x, -e branches:u ./koala 2 1 2>&1 | cut -d , -f 1 1>>braches21.data
done

for i in {1..10}
do
    perf stat -x, -e branches:u ./koala 3 0 2>&1 | cut -d , -f 1 1>>braches30.data
done

for i in {1..10}
do
    perf stat -x, -e branches:u ./koala 3 1 2>&1 | cut -d , -f 1 1>>braches31.data
done
