require 'spec_helper'

describe "Board" do
  let(:board) {Board.new(9)}

  before(:each) do 
    (1..9).each do |i|
      board.do_move(i," ")
    end
    board.reset
  end

  describe "win condition" do
    it "correctly assesses horizontal win condition" do
      board.do_move(1,"x")
      board.do_move(2,"x")
      board.do_move(3,"x")
      expect(board.win).to eql true
    end

    it "correctly assesses vertical win condition" do
      board.do_move(1,"x")
      board.do_move(4,"x")
      board.do_move(7,"x")
      expect(board.win).to eql true
    end

    it "correctly assesses diagonal win condition" do
      board.do_move(1,"x")
      board.do_move(5,"x")
      board.do_move(9,"x")
      expect(board.win).to eql true
    end

    it "correctly assesses draw" do
      board.do_move(1,"x")
      board.do_move(2,"x")
      board.do_move(3,"o")
      expect(board.draw).to eql false

      board.do_move(4,"x")
      board.do_move(5,"o")
      board.do_move(6,"o")
      expect(board.draw).to eql false

      board.do_move(7,"o")
      board.do_move(8,"x")
      board.do_move(9,"o")
      expect(board.draw).to eql true
    end
  end

  describe "#set_cell" do
    it "changes the value of a cell" do
      board.do_move(1,"x")
      expect(board.check_cell(0)).to eql "x"
    end

    it "doesnt allow to change an occupied cell" do
      board.do_move(1,"x")
      board.do_move(1,"o")
      expect(board.check_cell(0)).to eql "x"
    end
  end

end