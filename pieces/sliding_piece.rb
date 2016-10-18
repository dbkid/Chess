require_relative "piece"


class SlidingPiece < Piece

  def moves
    moves = []

    move_dir.each do |x,y|
      multiple = 1
      while @board.in_bounds?([@pos[0]+x*multiple,@pos[1]+y*multiple])
        pos = [@pos[0]+x*multiple,@pos[1]+y*multiple]
        if @board[pos].color == self.color
          break
        elsif @board[pos].color != self.color && @board[pos].color != nil
          moves << pos
          break
        else
          moves << pos
          multiple += 1
        end
      end
    end
    moves

  end

end
