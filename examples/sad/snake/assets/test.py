import numpy as np
import matplotlib.pyplot as plt

N = 100
results: list[np.uint8] = []

magic = 0x5C
seed = 0
for i in range(N):
    x = seed
    for j in range(3):
        c = x & 111
        x >>= 3
        x |= (c << 5)
    x = (x + magic) & 0xFF
    seed = x
    results.append(np.uint8(x))
    print(x)

plt.figure()
plt.hist(results, bins=256)
plt.show()
