require_relative "piece"

class Pawn < Piece
  attr_reader :type

  def initialize(pos, board, color, type)
    super(pos, board, color)
    @moved = false
    @type = type
  end

  def moves
    moves = []

    if type == :up
        if self.pos[0] != 6
          @moved = true
        end
        if @board.in_bounds?([@pos[0]-1, @pos[1]-1])
          if @board[[@pos[0]-1, @pos[1]-1]].color != nil && @board[[@pos[0]-1, @pos[1]-1]].color != self.color
            moves << [-1,-1]
          end
        end
        if @board.in_bounds?([@pos[0]-1, @pos[1]+1])
          if @board[[@pos[0]-1, @pos[1]+1]].color != nil && @board[[@pos[0]-1, @pos[1]+1]].color != self.color
            moves << [-1,1]
          end
        end
        if @moved == false && @board[[@pos[0]-1, @pos[1]]].color == nil && @board[[@pos[0]-2, @pos[1]]].color == nil
          moves << [-2,0]
        end
        if @board.in_bounds?([@pos[0]-1, @pos[1]])
          if @board[[@pos[0]-1, @pos[1]]].color == nil
            moves << [-1,0]
          end
        end
    end

    if type == :down
        if self.pos[0] != 1
          @moved = true
        end
        if @board.in_bounds?([@pos[0]+1, @pos[1]+1])
          if @board[[@pos[0]+1, @pos[1]+1]].color != nil && @board[[@pos[0]+1, @pos[1]+1]].color != self.color
            moves << [1,1]
          end
        end
        if @board.in_bounds?([@pos[0]+1, @pos[1]-1])
          if @board[[@pos[0]+1, @pos[1]-1]].color != nil && @board[[@pos[0]+1, @pos[1]-1]].color != self.color
            moves << [1,-1]
          end
        end
        if @moved == false && @board[[@pos[0]+1, @pos[1]]].color == nil && @board[[@pos[0]+2, @pos[1]]].color == nil
          moves << [2,0]
        end
        if @board.in_bounds?([@pos[0]+1, @pos[1]])
          if @board[[@pos[0]+1, @pos[1]]].color == nil
            moves << [1,0]
          end
        end
    end
    moves.map {|x,y| [@pos[0] + x, @pos[1] + y]}
  end

  def to_s
    " \u2659 ".encode("utf-8").colorize(color: @color, background: Piece.color_of_pos(@pos))
  end

end
