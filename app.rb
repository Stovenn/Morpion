require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'
require_relative 'lib/board.rb'
require_relative 'lib/board_case.rb'
require_relative 'lib/application.rb'


new_game = Game.new
while new_game.status == "on going"
  new_game.turn
end
new_game.new_round

# binding.pry