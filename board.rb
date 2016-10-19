require_relative "errors"
require_relative "pieces"

class Board

  attr_reader :grid

  def initialize(grid = Array.new(8){ |i| Array.new(8) { |j| NullPiece.new([i,j]) } })
    @grid = grid
  end

  def move(start, end_pos)

    piece = @grid[start[0]][start[1]]

    if piece.valid_move?(end_pos)
      @grid[start[0]][start[1]] = NullPiece.new([start[0],start[1]])
      @grid[end_pos[0]][end_pos[1]] = piece
      piece.pos = end_pos.dup
    else
      raise InvalidMove.new "You can't move there."
    end

  end

  def move!(start, end_pos)

    if @grid[start[0]][start[1]].class == NullPiece
      raise NullPieceError.new "There is no piece at this position."
    end

    piece = @grid[start[0]][start[1]]
    @grid[start[0]][start[1]] = NullPiece.new([start[0],start[1]])
    @grid[end_pos[0]][end_pos[1]] = piece
    piece.pos = end_pos.dup

  end

  def in_bounds?(pos)
    pos.all? {|el| el.between?(0,7)}
  end

  def over?(color)

    pieces = []
    @grid.each do |row|
      row.each do |piece|
        if piece.color == color
          pieces << piece
        end
      end
    end

    pieces.each do |piece|
      piece.moves.each do |move|
        if piece.valid_move?(move)
          return false
        end
      end
    end

    true

  end

  def [](pos)
    return @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def in_check?(color)
    other_side = []
    king_pos = nil
    @grid.each_with_index do |row,x|
      row.each_with_index do |piece,y|
        if piece.class == King && piece.color == color
          king_pos = [x,y]
        end

        if piece.color != color && piece.color != nil
          other_side << piece
        end
      end
    end

    opposing_moves = []
    other_side.each { |piece| opposing_moves += piece.moves  }

    opposing_moves.include?(king_pos)
  end

  def dup
    new_grid = Array.new(8) { Array.new(8) { NullPiece.new(nil) } }
    dup_board = Board.new(new_grid)

    @grid.each_with_index do |row,x|
      row.each_with_index do |piece,y|
        unless piece.is_a?(NullPiece)
          color = piece.color
          if piece.class == Pawn
            dup_board[[x,y]] = piece.class.new([x,y], dup_board, color, piece.type)
          else
            dup_board[[x,y]] = piece.class.new([x,y], dup_board, color)
          end
        end
      end
    end

    dup_board
  end


end
