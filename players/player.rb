class Player

  attr_reader :color, :name
  
  def initialize(name, color)
    @name = name
    @color = color
  end

  def set_board(board, display)
    @board = board
    @display = display
  end

end
