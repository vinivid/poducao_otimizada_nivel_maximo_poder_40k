import pandas as pd
import numpy as np

opts = ['no_opt', 'o1', 'o2', 'o3', 'os']

n_body_df = pd.DataFrame(index=opts, columns=['Tempo de Compilação', 'Tamanho', 'Tempo de execução'])
redux_df = pd.DataFrame(index=opts, columns=['Tempo de Compilação', 'Tamanho', 'Tempo de execução'])

for opt in opts:
    ok = [x.strip() for x in open(f'./dados/{opt}.cdata','r')]
    df = pd.read_csv(f'./dados/{opt}.rdata')
    n_body_df.loc[opt, 'Tempo de Compilação'] = ok[0]
    n_body_df.loc[opt, 'Tamanho'] = ok[2]
    n_body_df.loc[opt, 'Tempo de execução'] = f'{np.mean(df['n_body']):.7f}'
    redux_df.loc[opt, 'Tempo de Compilação'] = ok[1]
    redux_df.loc[opt, 'Tamanho'] = ok[3]
    redux_df.loc[opt, 'Tempo de execução'] = f'{np.mean(df['redux']):.7f}'

print('Dados do n_body:')
print(n_body_df)

print()
print()
print('Dados do redux')
print(redux_df)
