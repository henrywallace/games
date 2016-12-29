from collections import Counter
from random import randint

import matplotlib.pyplot as plt
import numpy as np
import pyprind
import scipy.stats as stats


def roll_dice(n=1):
    return (randint(1, 6) for _ in range(n))


def tenzi_turns():
    match, count = Counter(roll_dice(10)).most_common(1)[0]
    turns = 1
    while True:
        if count == 10:
            break
        c = Counter(roll_dice(10 - count))
        top_roll, top_count = c.most_common(1)[0]
        if top_count > count and top_roll != match:
            match = top_roll
            count = top_count
        else:
            count += c[match]
        turns += 1
    return turns


def tenzi_sample(n):
    pbar = pyprind.ProgPercent(n)
    samples = []
    for _ in range(n):
        samples.append(tenzi_turns())
        pbar.update()
    return samples


if __name__ == '__main__':
    data = tenzi_sample(10**4)
    plt.hist(data, bins=60, normed=True, color='w')
    shape, loc, scale = stats.gamma.fit(data, floc=1)
    print(shape, loc, scale)
    rv = stats.gamma(shape, loc, scale)
    x = np.linspace(0, 60)
    plt.plot(x, rv.pdf(x))
    plt.show()
