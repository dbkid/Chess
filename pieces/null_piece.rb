class NullPiece

  def initialize(pos)
    @pos = pos
  end

  def color
    nil
  end

  def self.color_of_pos(pos)
    if (pos[0] + pos[1]) % 2 == 0
      background = :light_white
    else
      background = :white
    end
  end

  def to_s
    "   ".colorize(background: NullPiece.color_of_pos(@pos))
  end

end
