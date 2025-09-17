import os

files_cache = os.listdir('cache')

for file_name in files_cache:
    media = sum([int(x) for x in open(f'./cache/{file_name}')]) / 10
    print(f'Média de acesso a cache {file_name.removeprefix('cache').removesuffix('.dat')}: {media}')

files_branch = os.listdir('branch')

for file_name in files_branch:
    media = sum([int(x) for x in open(f'./branch/{file_name}')]) / 10
    print(f'Média de branches {file_name.removeprefix('branches').removesuffix('.data')}: {media}')
