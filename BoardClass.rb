module BoardClass

  class Board
    attr_accessor :grid, :banner, :winner, :active_player, :teams, :turn

    def initialize(grid, banner)
      @grid = grid
      @banner = banner
      @active_player = nil
      @winner = nil
      @teams = ['X', 'O'].rotate(rand(2))
      @turn = [0, 1].rotate(rand(2))
    end
    
    def draw_board
      system "cls" || "clear"

      line = " | "
      spacer =  "-"

      puts "**" + @banner + "**"
      puts "\n"
      puts " " * 10 + @grid[6] + line + @grid[7] + line + @grid[8]
      puts " " * 9 + spacer * 11
      puts " " * 10 + @grid[3] + line + @grid[4] + line + @grid[5]
      puts " " * 9 + spacer * 11
      puts " " * 10 + @grid[0] + line + @grid[1] + line + @grid[2]
      puts "\n"
    end

    def check_win
      win_ranges = [
        [0, 1, 2], #bottom row
        [3, 4, 5], #middle row
        [6, 7, 8], #top row
        [6, 3, 0], #left column
        [7, 4, 1], #middle column
        [8, 5, 2], #right column
        [6, 4, 2], #diagonol top left to bottom right
        [0, 4, 8]  #diagonol bottom left to top right
      ]

      win_ranges.each_with_index do |range|

        if @grid.values_at(range[0], range[1], range[2]) == ['X', 'X', 'X']
          @winner = 'X'
          $game_active = false

        elsif @grid.values_at(range[0], range[1], range[2]) == ['O', 'O', 'O']
          @winner = 'O'
          $game_active = false
        end

      end

    end

    def check_tie
      if !@grid.include?(" ")
        @winner = "TIE"
        $game_active = false
      end
    end

    def check_turn
      if @turn[0] == 0
        @banner = "Player 1 - Place Your Marker"
        @active_player = $player_1
      else
        @banner = "Player 2 - Place Your Marker"
        @active_player = $player_2
      end
    end

  end

end