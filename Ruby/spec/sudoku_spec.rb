require 'sudoku'

# Main spec file
describe 'Sudoku solver' do
  before(:each) do
  @game = Sudoku.new 
  @valid_input = [[9, 3, 7, 1, 6, 8, 5, 2, 4],
                  [0, 4, 0, 0, 0, 0, 0, 0, 1],
                  [1, 0, 0, 3, 0, 0, 0, 7, 0],
                  [7, 2, 0, 0, 5, 0, 8, 0, 0],
                  [0, 0, 4, 0, 0, 0, 6, 0, 0],
                  [8, 0, 0, 0, 0, 9, 2, 0, 0],
                  [0, 0, 0, 0, 2, 0, 0, 0, 0],
                  [5, 0, 1, 0, 0, 0, 0, 0, 0],
                  ]
  end

  context '#Start--' do
    it 'can start' do
      expect(@game.output).to eq []
    end

    it 'can take an input' do
      @game.to_solve([1])
      expect(@game.initial_input).to eq [1]
    end
  end

  context '#Validation--' do
    it 'recognises a valid sudoku input' do
      expect(@game.to_solve('test')).to eq true
    end

  end
end