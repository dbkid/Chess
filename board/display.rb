require "colorize"
require_relative 'cursor'
require_relative "board"

class Display

  attr_accessor :held_piece

  def initialize(board)
    @board = board
    @cursor = Cursor.new([7,7],board)
    @held_piece = nil
  end

  def render
    pos = @cursor.cursor_pos

    @board.grid.each_with_index do |row,x|
      row.each_with_index do |piece,y|
        if pos[0] == x && pos[1] == y
          if held_piece.nil?
            print piece.to_s.colorize(background: :light_yellow)
          else
            print held_piece.to_s.colorize(background: :light_yellow)
          end
        else
          print piece
        end
      end
      puts
    end

    piece_pos = @cursor.get_input
    system 'clear'
    piece_pos
  end

end
