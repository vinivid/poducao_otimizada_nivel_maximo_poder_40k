for i in {1..10}
do
    ./koala 0 0 >> tmp00.dat
done

for i in {1..10}
do
    ./koala 0 1 >> tmp01.dat
done

for i in {1..10}
do
    ./koala 1 0 >> tmp10.dat
done

for i in {1..10}
do
    ./koala 1 1 >> tmp11.dat
done

for i in {1..10}
do
    ./koala 2 0 >> tmp20.dat
done

for i in {1..10}
do
    ./koala 2 1 >> tmp21.dat
done

for i in {1..10}
do
    ./koala 3 0 >> tmp30.dat
done

for i in {1..10}
do
    ./koala 3 1 >> tmp31.dat
done
