module PlayerClass
  class Player

    attr_accessor :name, :marker, :marker_pos

    def initialize(name, marker)
      @name = name
      @marker = marker
      @marker_pos = nil
    end

    def request_marker
      valid_pos = [1, 2, 3, 4, 5, 6, 7, 8, 9]

      print "Enter your marker position: "
      @marker_pos = gets.chomp.to_i

      if !valid_pos.include?(@marker_pos)
        $board.draw_board
        puts "Invalid marker placement. Try again!"
        request_marker()
      elsif $board.grid[@marker_pos - 1].match?(/[XO]/)
        $board.draw_board
        puts "Invalid marker placement. Try again!"
        request_marker()
      end

    end 

    def place_marker
      $board.grid[@marker_pos - 1] = @marker
    end

  end
end
