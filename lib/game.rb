require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'show.rb'
require 'pry'
class Game

  attr_accessor :current_player, :status, :board, :players_a
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.

  def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    puts "Bienvenue dans le jeu du morpion"

    @players_a = []

    puts "Joueur 1, veuillez saisir votre nom :" 
    @players_a << Player.new(gets.chomp, "O")
    puts "Joueur 2, veuillez saisir votre nom :" 
    @players_a << Player.new(gets.chomp, "X")

    @board = Board.new

    @status = "on going"

    @current_player = @players_a[0]
  end

  def turn
    while @status = "on going"
      Show.new.show_board(@board)
      @board.play_turn(@current_player)
      @board.victory?
      if @current_player == @players_a[0]
        @current_player = @players_a[1]
      else
        @current_player = @players_a[0]
      end
    end
    
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
  end

  def new_round
    @board = Board.new
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end
    if @board.victory? == true
      puts "Fin de partie"
    end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  end    

end

# binding.pry