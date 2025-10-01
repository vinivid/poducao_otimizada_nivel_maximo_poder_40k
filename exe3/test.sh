function rodar_sair() {
    num_sort=$1
    folder=$2
    num_run=$3

    ./clean
    ./koala $num_sort < vec_entrada.in
    mv ./gmon.out $folder/gmon$num_run.out
}

function sumarize() {
    path=$1
    name=$2
    files=("$@")
}

function main() {
    qui_path="./quicksort"
    mer_path="./merge"
    hep_path="./heap"

    for i in {1..10} 
    do 
        rodar_sair 0 $qui_path $i
        rodar_sair 1 ./merge $i
        rodar_sair 2 ./heap $i
    done

    qui_files=($qui_path/*.out)
    mer_files=($mer_path/*.out)
    hep_files=(./heap/*.out)

    gprof ./koala -s ${qui_files[@]}
    gprof ./koala gmon.sum > $qui_path/quick_resultados.txt
    rm gmon.sum

    gprof ./koala -s ${mer_files[@]}
    gprof ./koala gmon.sum > $mer_path/mer_resultados.txt
    rm gmon.sum

    gprof ./koala -s ${hep_files[@]}
    gprof ./koala gmon.sum > $hep_path/heap_resultados.txt
    rm gmon.sum

    printf "%s\n" "${qui_files[@]}" | xargs rm 
    printf "%s\n" "${mer_files[@]}" | xargs rm 
    printf "%s\n" "${hep_files[@]}" | xargs rm 
}

main