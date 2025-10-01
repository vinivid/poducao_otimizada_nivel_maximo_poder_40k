function rodar_sair() {
    num_sort=$1
    folder=$2
    num_run=$3

    ./clean
    ./koala $num_sort < vec_entrada.in
    gprof ./koala gmon.out > $2/saida$num_run.txt
    rm ./gmon.out
}

for i in {1..10} 
do 
    rodar_sair 0 ./quicksort $i
    rodar_sair 1 ./merge $i
    rodar_sair 2 ./heap $i
done 