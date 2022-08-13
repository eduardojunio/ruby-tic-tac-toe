require("./board.rb")

class Game
  def initialize
    @board = Board.new
    @current_player = "X"
  end

  def next_move
    print_intro
    board.print
    position = get_position
    board.fill_cell(position, current_player)
    won = board.winning_cell?(position)
    if won
      print_won_message
      return false
    end
    change_turn
    true
  end

  private

  def board
    @board
  end

  def current_player
    @current_player
  end

  def current_player=(new_current_player)
    @current_player = new_current_player
  end

  def print_and_flush(text)
    print text
    $stdout.flush
  end

  def change_turn
    self.current_player = current_player == "X" ? "O" : "X"
  end

  def get_position
    print_and_flush "#{current_player}'s turn (1-9): "
    gets.chomp.to_i
  end

  def print_intro
    puts "Ruby Tic Tac Toe by Eduardo Macêdo"
  end

  def print_won_message
    puts "Congratulations! #{current_player} won!!!"
  end
end
