require_relative 'player'

class ComputerPlayer < Player

  def get_possible_moves
    @pieces = []

    @board.grid.each do |row|
      row.each do |piece|
        if piece.color == self.color
          pieces << piece
        end
      end
    end

    @possible_moves = []
    @pieces.each do |piece|
      @possible_moves << piece.moves
    end

    @possible_moves
  end

  def get_moves_that_capture
    
  end

    next_move = false
    capture_move = nil
    move_pos = nil
    capture_move_pos = nil

    until pieces.empty?
      next_piece = pieces.sample
      next_piece.moves.each do |poss_move|
        if next_piece.valid_move?(poss_move)
          next_move = poss_move
          move_pos = next_piece.pos
          if @board[poss_move].color != self.color && @board[poss_move].color != nil
            capture_move = poss_move
            capture_move_pos = next_piece.pos
          end
        end
      end
      pieces.delete(next_piece)
    end
    unless capture_move.nil?
      next_move = capture_move
      move_pos = capture_move_pos
    end

    [move_pos, next_move]

  end

  def make_move
    @board.move(*get_move)
  end

end
