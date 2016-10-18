require_relative "piece"

class Queen < SlidingPiece

  def to_s
    " \u2655 ".encode("utf-8").colorize(color: @color, background: Piece.color_of_pos(@pos))
  end

  private

  def move_dir
    [[1,0],[-1,0],[0,1],[0,-1],[1,1],[-1,-1],[-1,1],[1,-1]]
  end

end
