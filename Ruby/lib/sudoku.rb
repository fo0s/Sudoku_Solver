# Main sudoku solver class

class Sudoku
  attr_reader :output, :initial_input

  def initialize
    @output = []
  end

  def to_solve(input)
    @initial_input = input
  end
end