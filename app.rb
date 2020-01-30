require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'
require_relative 'lib/board.rb'
require_relative 'lib/board_case.rb'


my_game = Game.new

my_game.turn
my_game.fin_de_partie

# binding.pry