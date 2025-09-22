import os

import numpy as np
from scipy import stats

def calc_ic(data : np.ndarray):
    n = len(data)
    mean = np.mean(data)
    std_dev = np.std(data, ddof=1)
    confidence_level = 0.95
    alpha = 1 - confidence_level
    degrees_of_freedom = n - 1
    t_critical = stats.t.ppf(1 - alpha / 2, degrees_of_freedom)
    standard_error = std_dev / np.sqrt(n)
    margin_of_error = t_critical * standard_error
    lower_bound = mean - margin_of_error
    upper_bound = mean + margin_of_error
    
    return (lower_bound, upper_bound)

print('Média de cache loads:')

files_cache = os.listdir('cache_load')
for file_name in files_cache:
    dados = np.array([int(x) for x in open(f'./cache_load/{file_name}')])
    media = np.mean(dados)
    ic = calc_ic(dados)
    print(f'\t{file_name.removeprefix('cache').removesuffix('.dat')}: {round(media, 2)} -> [{round(ic[0], 2)}; {round(ic[1], 2)}]')

print('Média de cache load misses:')

files_cache = os.listdir('cache_load_misses')
for file_name in files_cache:
    dados = np.array([int(x) for x in open(f'./cache_load_misses/{file_name}')])
    media = np.mean(dados)
    ic = calc_ic(dados)
    print(f'\t{file_name.removeprefix('cachem').removesuffix('.dat')}: {round(media, 2)} -> [{round(ic[0], 2)}; {round(ic[1], 2)}]')

print('Média de branch instructions:')

files_branch = os.listdir('branch_instructions')
for file_name in files_branch:
    dados = np.array([int(x) for x in open(f'./branch_instructions/{file_name}')])
    media = np.mean(dados)
    ic = calc_ic(dados)
    print(f'\t{file_name.removeprefix('braches').removesuffix('.data')}: {round(media, 2)} -> [{round(ic[0], 2)}; {round(ic[1], 2)}]')

print('Média de branch-misses:')

files_cache = os.listdir('branch_misses')
for file_name in files_cache:
    dados = np.array([int(x) for x in open(f'./branch_misses/{file_name}')])
    media = np.mean(dados)
    ic = calc_ic(dados)
    print(f'\t{file_name.removeprefix('braches').removesuffix('.data')}: {round(media, 2)} -> [{round(ic[0], 2)}; {round(ic[1], 2)}]')
