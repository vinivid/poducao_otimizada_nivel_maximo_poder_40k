testar_opt() {
  if [ "$1" = "no_opt" ]; then 
    { /usr/bin/time -f "%e" gcc -mavx n_body.c -o n_body;} 2>>./dados/$1.cdata
    { /usr/bin/time -f "%e" gcc -mavx redux.c -o redux;} 2>>./dados/$1.cdata
    stat -c %s n_body 1>> ./dados/$1.cdata
    stat -c %s redux 1>> ./dados/$1.cdata
  elif [ "$1" = "o1" ]; then 
    { /usr/bin/time -f "%e" gcc -O1 -mavx n_body.c -o n_body;} 2>>./dados/$1.cdata
    { /usr/bin/time -f "%e" gcc -O1 -mavx redux.c -o redux;} 2>>./dados/$1.cdata
    stat -c %s n_body >> ./dados/$1.cdata
    stat -c %s redux >> ./dados/$1.cdata
  elif [ "$1" = "o2" ]; then 
    { /usr/bin/time -f "%e" gcc -O2 -mavx n_body.c -o n_body;} 2>>./dados/$1.cdata
    { /usr/bin/time -f "%e" gcc -O2 -mavx redux.c -o redux;} 2>>./dados/$1.cdata
    stat -c %s n_body >> ./dados/$1.cdata
    stat -c %s redux >> ./dados/$1.cdata
  elif [ "$1" = "o3" ]; then 
    { /usr/bin/time -f "%e" gcc -O3 -mavx n_body.c -o n_body;} 2>>./dados/$1.cdata
    { /usr/bin/time -f "%e" gcc -O3 -mavx redux.c -o redux;} 2>>./dados/$1.cdata
    stat -c %s n_body >> ./dados/$1.cdata
    stat -c %s redux >> ./dados/$1.cdata
  elif [ "$1" = "os" ]; then 
    { /usr/bin/time -f "%e" gcc -Os -mavx n_body.c -o n_body;} 2>>./dados/$1.cdata
    { /usr/bin/time -f "%e" gcc -Os -mavx redux.c -o redux;} 2>>./dados/$1.cdata
    stat -c %s n_body >> ./dados/$1.cdata
    stat -c %s redux >> ./dados/$1.cdata
  fi
  
  echo "n_body,redux" >> ./dados/$1.rdata

  for i in {1..10}
  do 
    echo "$(./n_body 50000000),$(./redux 12)" >> ./dados/$1.rdata
  done
}

testa_tudo() {
  testar_opt no_opt
  testar_opt o1
  testar_opt o2
  testar_opt o3
  testar_opt os
}

#testa_tudo
