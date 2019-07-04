# Main sudoku solver class

class Sudoku
  attr_reader :output, :initial_input

  def initialize
    @output = []
  end

  def to_solve(input)
    # Error checking
    false if !input.is_a?(Array) 

    # Continue
    @initial_input = input
  end

  def calculate(row, col)
    solve = @initial_input[row, col]

    # Go to the next row when it reaches the end of the previous row.
    row += 1 and col = 0 if col == 9
    number = @initial_input[row][col]

    # Number crunching using brute force
    if number == 0
      (1..9).each do |brute_number|
        if valid_in_row_and_column?(row, col, brute_number)
          @initial_input[row][col] = brute_number
          calculate(row, col + 1)
        end
      end

      # If not right change back to original
      @initial_input[row][col] = 0
    else
      calculate(row, col + 1)
    end
  end

  def valid_in_row_and_column?(row, col, brute_number)
    (0..8).each do |index|
      # Compare with other value on the same row
      return false if @initial_input[row][index] == brute_number && col != index
      # Compare with other value on the same column
      return false if @initial_input[index][col] == brute_number && row != index
    end

    true
  end
end

# Run program
@valid_input = [[9, 3, 7, 1, 6, 8, 5, 2, 4],
                [0, 4, 0, 0, 0, 0, 0, 0, 1],
                [1, 0, 0, 3, 0, 0, 0, 7, 0],
                [7, 2, 0, 0, 5, 0, 8, 0, 0],
                [0, 0, 4, 0, 0, 0, 6, 0, 0],
                [8, 0, 0, 0, 0, 9, 2, 0, 0],
                [0, 0, 0, 0, 2, 0, 0, 0, 0],
                [5, 0, 1, 0, 0, 0, 0, 0, 0],
                ]

game = Sudoku.new
game.to_solve(@valid_input)
game.calculate(0, 0)