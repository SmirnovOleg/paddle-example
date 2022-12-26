import sys

from kernel.bugloc.app import Bar
from paddle_example_root.util import some_func

if __name__ == '__main__':
    for i in range(10000000):
        some_func(i)
    print("Hello")
    print(sys.path)
    bar = Bar("name")
    print(bar.name)
