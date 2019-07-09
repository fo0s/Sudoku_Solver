import random


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


def has_duplicates_in_box(game, x, y):
    start_x = x // 3 * 3
    start_y = y // 3 * 3

    box = []

    for i in range(start_y, start_y + 3):
        for j in range(start_x, start_x + 3):
            if game[i][j] != 0:
                box.append(game[i][j])

    return len(box) != len(set(box))


def has_duplicates(game, x, y):
    return (has_duplicates_in_column(game, x)
            or has_duplicates_in_row(game, y)
            or has_duplicates_in_box(game, x, y))


def main():
    game = [
        [5, 3, 0, 0, 7, 8, 0, 0, 0],
        [6, 0, 0, 1, 9, 5, 0, 0, 0],
        [0, 9, 8, 0, 0, 0, 0, 6, 0],
        [8, 0, 0, 0, 6, 0, 0, 0, 3],
        [4, 0, 0, 8, 0, 3, 0, 0, 1],
        [7, 0, 0, 0, 2, 0, 0, 0, 6],
        [0, 6, 0, 0, 0, 0, 2, 8, 0],
        [0, 0, 0, 4, 1, 9, 0, 0, 5],
        [0, 0, 0, 0, 8, 0, 0, 7, 9],
    ]
    sudoku(game)
    print(game)


if __name__ == '__main__':
    main()


# Expected output
#     [[5, 3, 4, 6, 7, 8, 9, 1, 2],
#     [6, 7, 2, 1, 9, 5, 3, 4, 8],
#     [1, 9, 8, 3, 4, 2, 5, 6, 7],
#     [8, 5, 9, 7, 6, 1, 4, 2, 3],
#     [4, 2, 6, 8, 5, 3, 7, 9, 1],
#     [7, 1, 3, 9, 2, 4, 8, 5, 6],
#     [9, 6, 1, 5, 3, 7, 2, 8, 4],
#     [2, 8, 7, 4, 1, 9, 6, 3, 5],
#     [3, 4, 5, 2, 8, 6, 1, 7, 9]]
