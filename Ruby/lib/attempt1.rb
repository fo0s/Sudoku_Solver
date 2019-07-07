class Sudoku
  attr_reader :solved

  def initialize(input)
    @initial_input = input
    @solved = []
  end

  def is_valid?(x, y, z)
    valid_in_row_and_column?(x, y, z) && valid_in_block?(x, y, z)
  end

  def valid_in_row_and_column?(x, y, z)
    (0..8).each do |i|
      return false if @initial_input[x][i] == z && y != i
      return false if @initial_input[i][y] == z && x != i
    end
    true
  end

  def valid_in_block?(x, y, z)
    # Assign areas for the blocks
    block_x = block(x)
    block_y = block(y)

    block_x.each do |a|
      block_y.each do |b|
        # Compare with other value in the same block
        return false if @initial_input[a][b] == z && x != a and y != b
      end
    end

    true
  end

  def block(id)
    [(0..2), (3..5), (6..8)].each do |i|
      return i if i.include?(id)
    end
  end

def calculate(x, y)
   # print when solved
   if (x == 8 && y == 9)
     (0..8).each { |i| @solved << @initial_input[i].clone }
     return
   end

    # move to next row.
    x += 1 and y = 0 if y == 9

    value = @initial_input[x][y]

    if value == 0
      (1..9).each do |z|
        if is_valid?(x, y, z)
          @initial_input[x][y] = z
          calculate(x, y + 1)
        end
      end

      # if nothing found set back to original
      @initial_input[x][y] = 0
    else
      calculate(x, y + 1)
    end
  end
end

# # Run program
# initial_input = [
#   [5, 3, 0, 0, 7, 8, 0, 0, 0],
#   [6, 0, 0, 1, 9, 5, 0, 0, 0],
#   [0, 9, 8, 0, 0, 0, 0, 6, 0],
#   [8, 0, 0, 0, 6, 0, 0, 0, 3],
#   [4, 0, 0, 8, 0, 3, 0, 0, 1],
#   [7, 0, 0, 0, 2, 0, 0, 0, 6],
#   [0, 6, 0, 0, 0, 0, 2, 8, 0],
#   [0, 0, 0, 4, 1, 9, 0, 0, 5],
#   [0, 0, 0, 0, 8, 0, 0, 7, 9],
# ]

# game = Sudoku.new(initial_input)
# game.calculate(0, 0)
# p game.solved

# # Expected output;
# # [ [5, 3, 4, 6, 7, 8, 9, 1, 2], 
# #   [6, 7, 2, 1, 9, 5, 3, 4, 8], 
# #   [1, 9, 8, 3, 4, 2, 5, 6, 7], 
# #   [8, 5, 9, 7, 6, 1, 4, 2, 3], 
# #   [4, 2, 6, 8, 5, 3, 7, 9, 1], 
# #   [7, 1, 3, 9, 2, 4, 8, 5, 6], 
# #   [9, 6, 1, 5, 3, 7, 2, 8, 4], 
# #   [2, 8, 7, 4, 1, 9, 6, 3, 5], 
# #   [3, 4, 5, 2, 8, 6, 1, 7, 9] ]