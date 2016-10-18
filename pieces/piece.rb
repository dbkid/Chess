class Piece

  attr_reader :color
  attr_accessor :pos

  def initialize(pos, board, color)
    @board = board
    @pos = pos
    @color = color
  end

  def valid_move?(end_pos)
    duped_board = @board.dup
    duped_board.move!(@pos, end_pos)
    !duped_board.in_check?(@color) && self.moves.include?(end_pos)
  end

  def self.color_of_pos(pos)
    if (pos[0] + pos[1]) % 2 == 0
      background = :light_white
    else
      background = :white
    end
  end

end
