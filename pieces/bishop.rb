require_relative "sliding_piece"

class Bishop < SlidingPiece

  def to_s
    " \u2657 ".encode("utf-8").colorize(color: @color, background: Piece.color_of_pos(@pos))
  end

  private

  def move_dir
    [[1,1],[-1,-1],[-1,1],[1,-1]]
  end

end
