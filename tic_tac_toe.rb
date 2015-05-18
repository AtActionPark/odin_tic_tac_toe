require_relative 'Board'
$play = true

puts "Ruby Tic tac toe"
board = Board.new(9)


def take_turn (player, board)
  puts "Player #{player} turn : please enter cell number"
  player_move = gets.chomp.to_i
  board.set_cell(player_move, player == 1? "x" : "o")

  if board.win == true
    puts "player #{player} wins"
    $play = false
  end

  if board.draw == true
    puts "draw"
    $play = false
  end
end

while $play
  take_turn(1,board)

  if !$play
    break

  end
  take_turn(2,board)
end






