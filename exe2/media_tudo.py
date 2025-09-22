import os

print('Média de cache loads:')

files_cache = os.listdir('cache_load')
for file_name in files_cache:
    media = sum([int(x) for x in open(f'./cache_load/{file_name}')]) / 10
    print(f'\t{file_name.removeprefix('cache').removesuffix('.dat')}: {media}')

print('Média de cache load misses:')

files_cache = os.listdir('cache_load_misses')
for file_name in files_cache:
    media = sum([int(x) for x in open(f'./cache_load_misses/{file_name}')]) / 10
    print(f'\t{file_name.removeprefix('cachem').removesuffix('.dat')}: {media}')

print('Média de branch instructions:')

files_branch = os.listdir('branch_instructions')
for file_name in files_branch:
    media = sum([int(x) for x in open(f'./branch_instructions/{file_name}')]) / 10
    print(f'\t{file_name.removeprefix('branches').removesuffix('.data')}: {media}')

print('Média de branch-misses:')

files_cache = os.listdir('branch_misses')
for file_name in files_cache:
    media = sum([int(x) for x in open(f'./branch_misses/{file_name}')]) / 10
    print(f'\t{file_name.removeprefix('branches').removesuffix('.data')}: {media}')
