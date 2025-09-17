import os

files = os.listdir('tempos')

for file_name in files:
    media = sum([float(x) for x in open(f'./tempos/{file_name}')]) / 10
    print(f'Média de tempo {file_name.removeprefix('tmp').removesuffix('.dat')}: {media}')
