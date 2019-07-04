require 'sudoku'

# Main spec file
describe 'Sudoku solver' do
  before(:each) { @game = Sudoku.new }
  context '#Start--' do
    it 'can start' do
      expect(@game.output).to eq []
    end

    it 'can take an input' do
      @game.to_solve([1])
      expect(@game.initial_input).to eq [1]
    end
  end
end