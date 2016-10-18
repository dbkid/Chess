require_relative "display"
require_relative "players"

class Game

  ROW = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

  attr_reader :player1, :player2
  attr_accessor :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @board = Board.new
    setup_back_row(player1.color, 0)
    setup_back_row(player2.color, 7)

    setup_front_row(player1.color, 1, :down)
    setup_front_row(player2.color, 6, :up)
    @display = Display.new(@board)
    @player1.set_board(@board, @display)
    @player2.set_board(@board, @display)
  end

  def setup_back_row(color,row)
    ROW.each_with_index do |piece_type, column|
      @board[[row, column]] = piece_type.new([row,column], @board, color)
    end
  end

  def setup_front_row(color, row, type)
    (0..7).each do |column|
      @board[[row,column]] = Pawn.new([row,column], @board, color, type)
    end
  end

  def swap_player
    self.current_player = self.current_player == player1 ? player2 : player1
  end

  def play
    until @board.over?(@current_player.color)
      self.current_player.make_move
      swap_player unless @board.over?(@current_player.color)
    end
    puts "#{@current_player.name} wins"
  end

end

player1 = HumanPlayer.new("Henry", :black)
player2 = ComputerPlayer.new("Danielle", :cyan)

g = Game.new(player1,player2)
g.play
