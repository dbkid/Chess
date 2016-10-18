require_relative 'sliding_piece'

class Rook < SlidingPiece

  def to_s
    " \u2656 ".encode("utf-8").colorize(color: @color, background: Piece.color_of_pos(@pos))
  end

  private

  def move_dir
    [[1,0],[-1,0],[0,1],[0,-1]]
  end

end
