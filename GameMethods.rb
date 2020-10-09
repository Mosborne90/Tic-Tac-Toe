
module GameMethods

  #Main Menu
  def clear_terminal
    system "cls" || "clear"
  end

  def main_menu
    GameMethods.clear_terminal
    puts "**Welcome to Tic-Tac-Toe!**"
    GameMethods.draw_blank_board
    puts "Press enter to shuffle teams or type 'exit'"
    selection = gets.chomp.downcase

    if selection == 'exit'
      GameMethods.clear_terminal
      exit
    end
  
  end

  def draw_blank_board
    line = " | "
    spacer =  "-"

    puts "\n"
    puts " " * 10 + " " + line + " " + line + " " 
    puts " " * 9 + spacer * 11
    puts " " * 10 + " " + line + " " + line + " " 
    puts " " * 9 + spacer * 11
    puts " " * 10 + " " + line + " " + line + " " 
    puts "\n"
  end

  #Game Setup
  def create_objects
    #Create Player & Board Objects
    $board = Board.new((1..9).to_a.map{|v| v = " "}, "")
    $player_1 = Player.new("Player 1", $board.teams[0])
    $player_2 = Player.new("Player 2", $board.teams[1])
    
    #Announce Player Markers
    puts "Player 1 has been set to Team '#{$player_1.marker}'"
    puts "Player 2 has been set to Team '#{$player_2.marker}'"

    if $board.turn == [0, 1]
      $board.banner = "\nPlayer 1 was randomly selected to go first"
    else
      $board.banner = "\nPlayer 2 was randomly selected to go first"
    end

    puts $board.banner

  end

  def start_game
    puts "\nNumpad Keys(1-9) control marker placement"
    print "\nPress Enter to start the game! "
    selection = nil

    while !selection do
      selection = gets.downcase
    end

  end

  #Game Over
  def announce_winner
    if $player_1.marker == $board.winner
      $board.banner = "Player 1 wins the game!"
    elsif $player_2.marker == $board.winner
      $board.banner = "Player 2 wins the game!"
    elsif $board.winner == 'TIE'
      $board.banner = "This game is a tie!"
    end
  end  

  def restart_menu
    response = nil

    while response == nil
      $board.draw_board
      print "Press 'Enter' to play again or type 'exit': "
      response = gets.chomp.downcase
    end

    if response == "exit"
      GameMethods.clear_terminal
      exit
    end
 
  end

  def reset_game
    $board = nil
    $player_1 = nil
    $player_2 = nil
    $game_active = true
    
    GameMethods.clear_terminal
  end

end