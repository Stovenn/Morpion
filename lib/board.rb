require 'pry'
require_relative 'board_case.rb'
require_relative 'show.rb'
require_relative 'player'

class Board

  attr_accessor :board_cases_a, :count_turn
  
  def initialize
    #TO DO :
    @board_cases_a = []

    rows = ["a","b","c"]
    columns = ["1", "2", "3"]
    rows.each {|row| 
    columns.each {|column|
    @board_cases_a << BoardCase.new(row+column)}
    }
    @count_turn = 0
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
  end

  def play_turn(player)
    puts "Au tour de #{player.name} !"
    puts "Quel est ton prochain mouvement ?"
    choice = gets.chomp
    @board_cases_a.each {|c| c.value = player.type if c.case_id == choice && c.value == " "}
    @count_turn += 1
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
  end

  
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul

end



# binding.pry