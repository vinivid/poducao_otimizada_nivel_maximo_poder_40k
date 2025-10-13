no_opt:
	time gcc -mavx n_body.c -o n_body
	time gcc -mavx redux.c -o redux 

o_one:
	gcc -mavx -O1 n_body.c -o n_body
	gcc -mavx -O1 redux.c -o redux

o_two:
	gcc -mavx -O2 n_body.c -o n_body
	gcc -mavx -O2 redux.c -o redux

o_three:
	gcc -mavx -O3 n_body.c -o n_body
	gcc -mavx -O3 redux.c -o redux

o_s:
	gcc -mavx -Os n_body.c -o n_body
	gcc -mavx -Os redux.c -o redux
