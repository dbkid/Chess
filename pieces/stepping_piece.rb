require_relative "piece"

class SteppingPiece < Piece

  def moves

    moves = []

    move_dir.each do |x,y|
      pos = [@pos[0]+x, @pos[1]+y]
      if @board.in_bounds?(pos)
        unless @board[pos].color == self.color
          moves << pos
        end
      end
    end

    moves

  end

end
