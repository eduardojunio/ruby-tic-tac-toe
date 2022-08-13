require("./game.rb")

system("clear")

game = Game.new
while game.next_move
  system("clear")
end
