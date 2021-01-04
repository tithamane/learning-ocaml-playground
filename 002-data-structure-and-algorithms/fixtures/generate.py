# Generates a list of random numbers.
# TODO: Write this in ocaml in future.
import argparse
import random

parser = argparse.ArgumentParser()

parser.add_argument("--range", type=int, help="The amount of numbers to generate.", required=True)

if __name__ == "__main__":
    args = parser.parse_args()

    values = list(range(args.range))
    random.seed('1')
    random.shuffle(values)

    with open(f"./{args.range}.txt", "w+") as file:
        content = [f"{val}\n" for val in values]
        file.writelines(content)