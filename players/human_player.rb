require_relative 'player'

class HumanPlayer < Player

  def make_move
    have_piece = false
    end_move = false
    until end_move
      pos = @display.render
      unless pos.nil?
        #debugger
        if @board[pos].color == self.color
          start_pos = pos.dup
          have_piece = true
          @display.held_piece = @board[start_pos]
        elsif have_piece
          begin
            end_pos = pos.dup
            @board.move(start_pos,end_pos)
            have_piece = false
            @display.held_piece = nil
            end_move = true
          rescue InvalidMove => e
            puts "#{e.message}"
            puts "Make another move."
          end
        end
      end
    end
  end

end
