# create a function that requires a lot of cpu for cpu tesing purpoeses

import time


def fib(n):
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)


def main():
    while True:
        fib(40)
        time.sleep(0.1)
        print("I'm still alive", flush=True)


if __name__ == "__main__":
    main()
