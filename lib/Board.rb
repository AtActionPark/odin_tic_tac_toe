class Board
  attr_reader :win 
  attr_accessor :draw 

  def initialize square_size
    if ![9,16,25,36,49,64,81,100].include?(square_size)
      puts "Please choose between 9, 16, 25, 36, 49, 81 or 100"
    else
      @square_size = square_size
      @state = []
      (1..square_size).each do |i|
        @state.push(" ")
        end
      @win = false
      @draw = false
    end
  end

  def do_move (cell, value)
    set_cell(cell, value)
    check_state
    check_draw
  end  

  def check_cell(cell)
    @state[cell]
  end

  def reset_board
    puts ""
    puts "New state"
    draw_boards
  end

  def draw_boards
    print_legend
    print_current_board
  end

  def reset
    @win = false
    @draw = false
  end

  private

  def print_legend
    puts " "
    puts " Reference board"
    print "   |"
    line = 0
    @size = @square_size**0.5
    array = (1..@square_size).to_a
    array.each do |i|
      if line == @size
        puts ""
        puts "   "  + "--"*@size*4 +"-"
        print "   |"
        line = 0
      end
      if i <10 
        print "   " + i.to_s + "   |"
      else
        print "  " + i.to_s + "   |"
      end
      line+=1
    end
    puts ""
  end

  def print_current_board
    puts " "
    puts " Current Board"
    print "   |"
    line = 0
    @size = @square_size**0.5
    array = (1..@square_size).to_a
    array.each do |i|
      if line == @size
        puts ""
        puts "   "  + "--"*@size*4 +"-"
        print "   |"
        line = 0
      end
      print "   " + @state[i-1] + "   |"
      line+=1
    end
    puts ""
  end

   def check_state
    #need to automate win_conditions for size >3
    @win_conditions = [[0,1,2], [3,4,5], [6,7,8],
                       [0,3,6], [1,4,7], [2,5,8],
                       [0,4,8], [6,4,2]]
    @win_conditions.each do |i|
      if @state[i[0]] == @state[i[1]] && @state[i[0]] == @state[i[2]] && @state[i[0]] != " "
        @win = true
      end
    end
  end

  def check_draw
    @draw = true
    @state.each do |i|
        @draw = false if i == " "
    end
  end

  def set_cell  (cell, value)
    if @state[cell-1] == " "
      @state[cell-1] = value
    else
      puts "Please input an empty cell"
      player_two_move = gets.chomp.to_i
      set_cell(player_two_move, value)
    end
  end

end