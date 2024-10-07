import sys
import zlib
from pathlib import Path
from argparse import ArgumentParser

parser = ArgumentParser(description="Zlib utility.")
parser.add_argument("path", type=Path, nargs="?")

group = parser.add_mutually_exclusive_group(required=True)
group.add_argument("-e", "--encode", action="store_true")
group.add_argument("-d", "--decode", action="store_true")


def main():
    args = parser.parse_args()

    if not sys.stdin.isatty():  # Check if there's piped input
        data = sys.stdin.buffer.read()
    elif args.path:
        data = args.path.read_bytes()
    else:
        parser.error("No input provided")

    if args.encode:
        print(zlib.compress(data))
    elif args.decode:
        print(zlib.decompress(data))


if __name__ == "__main__":
    main()
