require_relative "stepping_piece"

class Knight < SteppingPiece

  def to_s
    " \u2658 ".encode("utf-8").colorize(color: @color, background: Piece.color_of_pos(@pos))
  end

  private

  def move_dir
    [[1,2],[1,-2],[-1,2],[-1,-2],
    [2,1],[2,-1],[-2,1],[-2,-1]]
  end

end
