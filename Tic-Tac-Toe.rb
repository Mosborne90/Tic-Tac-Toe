require_relative "GameMethods"
require_relative "PlayerClass"
require_relative "BoardClass"
include GameMethods
include PlayerClass
include BoardClass

$board = nil
$player_1 = nil
$player_2 = nil
$game_active = true

loop do
  GameMethods.main_menu
  GameMethods.create_objects
  GameMethods.start_game

  while $game_active do
    $board.check_turn
    $board.draw_board
    $board.active_player.request_marker
    $board.active_player.place_marker
    $board.check_win
    $board.check_tie
    $board.turn.rotate!(1)
  end

  GameMethods.announce_winner
  GameMethods.restart_menu
  GameMethods.reset_game
end


