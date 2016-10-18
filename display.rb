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






    # while true
    #   pos = @cursor.cursor_pos
    #   # :(
    #   if pos[0] == 0
    #     print " _"*pos[1]
    #     print " _".colorize(:yellow)
    #     puts " _" * (7-pos[1])
    #   else
    #     puts " _" * 8
    #   end
    #   @board.grid.each_with_index do |row,i|
    #     row.each_with_index do |space, j|
    #       if j == 7
    #         if pos[1] == j && pos[0] == i
    #           puts "|_|".colorize(:yellow)
    #         elsif pos[1] == 6 && pos[0] == i
    #           print "|".colorize(:yellow)
    #           puts "_|"
    #         elsif pos[0] ==i+1 && pos[1] == j
    #           print "|"
    #           print "_".colorize(:yellow)
    #           puts "|"
    #         else
    #           puts "|_|"
    #         end
    #       elsif pos[0] == i && pos[1] == j
    #         print "|_".colorize(:yellow)
    #       elsif pos[0] ==i && pos[1] == j -1
    #         print "|".colorize(:yellow)
    #         print "_"
    #       elsif pos[0] ==i+1 && pos[1] == j
    #         print "|"
    #         print "_".colorize(:yellow)
    #       else
    #         print "|_"
    #       end
    #     end
    #   end
    #   @cursor.get_input
    #   system 'clear'
    # end



      #render


end
