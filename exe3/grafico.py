import matplotlib.pyplot as plt
import numpy as np

t_A_sort = np.array([3, 3, 3, 3, 3, 3, 3, 3, 3, 3])
t_B_sort = np.array([3, 3, 3, 3, 3, 3, 3, 3, 3, 3])
t_C_sort = np.array([3, 3, 3, 3, 3, 3, 3, 3, 3, 3])

x = np.array(["A_sort", "B_sort", "C_sort",])
y = np.array([np.mean(t_A_sort), np.mean(t_B_sort), np.mean(t_C_sort)])

plt.bar(x,y)
plt.show()