require 'sudoku'

# Main spec file
describe 'Sudoku solver' do
  context '#Start--' do
    it 'can start' do
      @game = Sudoku.new
      expect(@game.output).to eq []
    end
  end
end