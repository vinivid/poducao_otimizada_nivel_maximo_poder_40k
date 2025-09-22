for i in {1..10}
do
    ./koala 0 0 >> ./tempos/tmp00.dat
done

for i in {1..10}
do
    ./koala 0 1 >> ./tempos/tmp01.dat
done

for i in {1..10}
do
    ./koala 1 0 >> ./tempos/tmp10.dat
done

for i in {1..10}
do
    ./koala 1 1 >> ./tempos/tmp11.dat
done

for i in {1..10}
do
    ./koala 2 0 >> ./tempos/tmp20.dat
done

for i in {1..10}
do
    ./koala 2 1 >> ./tempos/tmp21.dat
done

for i in {1..10}
do
    ./koala 3 0 >> ./tempos/tmp30.dat
done

for i in {1..10}
do
    ./koala 3 1 >> ./tempos/tmp31.dat
done
