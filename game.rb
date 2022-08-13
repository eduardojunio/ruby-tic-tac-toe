require("./board.rb")

class Game
  attr_accessor :board, :current_player, :moves_count

  def initialize
    @board = Board.new
    @current_player = "X"
    @moves_count = 0
  end

  def next_move
    puts "Ruby Tic Tac Toe by Eduardo Macêdo"
    puts board
    print "#{current_player}'s turn (1-9): "
    position = read_number_input
    board.fill_cell(position, current_player)
    won = board.winning_cell?(position)
    if won
      puts "Congratulations! #{current_player} won!!!"
      return false
    end
    self.moves_count += 1
    if moves_count >= 9
      puts "It's a draw! Try again!"
      return false
    end
    change_turn
    true
  end

  private

  def change_turn
    self.current_player = current_player == "X" ? "O" : "X"
  end

  def read_input
    gets.chomp
  end

  def read_number_input
    read_input.to_i
  end
end
