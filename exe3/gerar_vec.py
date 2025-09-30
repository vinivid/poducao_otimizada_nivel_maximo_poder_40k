import random
TAM_VETOR = 10000000
with open('vec_entrada.in', 'w') as fw:
    for _ in range(0, TAM_VETOR):
        fw.write(f'{random.randint(-214748364, 214748364)} ')