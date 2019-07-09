import random
from pprint import pprint


def sudoku(game, x=0, y=0):
    available_numbers = list(range(1, 10))

    while True:
        if not available_numbers:
            game[y][x] = 0
            return False

        chosen_number = random.choice(available_numbers)
        available_numbers.remove(chosen_number)

        game[y][x] = chosen_number

        if has_duplicates(game, x, y):
            continue

        if x == 8:
            next_x = 0
            next_y = y + 1
        else:
            next_x = x + 1
            next_y = y

        if next_y > 8:
            return True

        if sudoku(game, next_x, next_y):
            return True


def has_duplicates_in_row(game, y):
    row = [game[y][x] for x in range(9) if game[y][x] != 0]

    return len(row) != len(set(row))


def has_duplicates_in_column(game, x):
    column = [game[y][x] for y in range(9) if game[y][x] != 0]

    return len(column) != len(set(column))


def has_duplicates(grid, x, y):
    return (has_duplicates_in_column(grid, x) or has_duplicates_in_row(grid, y))


def main():
    game = [
        [0, 0, 0, 2, 6, 0, 7, 0, 1],
        [6, 8, 0, 0, 7, 0, 0, 9, 0],
        [1, 9, 0, 0, 0, 4, 5, 0, 0],
        [8, 2, 0, 1, 0, 0, 0, 4, 0],
        [0, 0, 4, 6, 0, 2, 9, 0, 0],
        [0, 5, 0, 0, 0, 3, 0, 2, 8],
        [0, 0, 9, 3, 0, 0, 0, 7, 4],
        [0, 4, 0, 0, 5, 0, 0, 3, 6],
        [7, 0, 3, 0, 1, 8, 0, 0, 0]
    ]
    sudoku(game)
    pprint(game)


if __name__ == '__main__':
    main()
