import os
import numpy as np
from scipy import stats

files = os.listdir('tempos')

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

for file_name in files:
    data = np.array([float(x) for x in open(f'./tempos/{file_name}')])
    media = np.mean(data)
    ic = calc_ic(data)
    print(f'Média de tempo {file_name.removeprefix('tmp').removesuffix('.dat')}: {round(media, 2)} -> [{round(ic[0], 2)}; {round(ic[1], 2)}]')
