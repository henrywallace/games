from collections import Counter
from random import randint


class Mastermind(object):
    def __init__(self, colors=6, holes=4):
        self.colors = colors
        self.holes = holes
        self.code = self.randcode()
        self.code_counts = Counter(self.code)

    def randcode(self):
        return [randint(1, self.colors - 1) for _ in range(self.holes)]

    def grade(self, guess):
        exact = sum(i == j for i, j in zip(guess, self.code))
        guess_counts = Counter(guess)
        near = sum(min(guess_counts[i], self.code_counts[i])
                   for i in range(self.colors)) - exact
        return exact, near


def naive_solver(mm):
    # note that near will always be 0, so we ignore it
    color_grades = sorted((mm.grade([i]*mm.holes)[0], i)
                          for i in range(mm.colors))
    color_grades = [(e, i) for e, i in color_grades if e > 0]

    def locations(color, exact, a, b):
        c = (a + b)//2
        print(c)

    print(color_grades)
    c, g = color_grades[0]
    locations(c, g, 0, mm.holes - 1)


if __name__ == '__main__':
    while True:
        mm = Mastermind()
        print(mm.code)
        naive_solver(mm)
