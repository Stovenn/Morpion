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
    while @status == "on going"
      Show.new.show_board(@board)
      @board.play_turn(@current_player)

      if victory?
        @status = "done"
      else
        if @current_player == @players_a[0]
          @current_player = @players_a[1]
        else
          @current_player = @players_a[0]
        end
      end
    end
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
  end

  def victory?
    if @board.count_turn == 9
      puts "\n\n"
      puts "\n\n"
      puts "!!!!! Match nul !!!!!"
      puts "\n\n"
      return true
    end
    
    if (@board.board_cases_a[0].value == 'X' && @board.board_cases_a[1].value == 'X' && @board.board_cases_a[2].value == 'X') || (@board.board_cases_a[3].value == 'X' && @board.board_cases_a[4].value == 'X' && @board.board_cases_a[5].value == 'X') || (@board.board_cases_a[6].value == 'X' && @board.board_cases_a[7].value == 'X' && @board.board_cases_a[8].value == 'X') || (@board.board_cases_a[0].value == 'X'  && @board.board_cases_a[3].value == 'X' && @board.board_cases_a[6].value == 'X') || (@board.board_cases_a[1].value == 'X' && @board.board_cases_a[4].value == 'X' && @board.board_cases_a[7].value == 'X') || (@board.board_cases_a[2].value == 'X' && @board.board_cases_a[5].value == 'X' && @board.board_cases_a[8].value == 'X') || (@board.board_cases_a[0].value == 'X' && @board.board_cases_a[4].value == 'X' && @board.board_cases_a[8].value == 'X') || (@board.board_cases_a[2].value == 'X' && @board.board_cases_a[4].value == 'X' && @board.board_cases_a[6].value == 'X')
      puts "\n\n"
      puts "\n\n"
      puts "!!!!! Victoire de #{@players_a[1].name} !!!!!"
      puts "\n\n"
      return true
    elsif  (@board.board_cases_a[0].value == 'O' && @board.board_cases_a[1].value == 'O' && @board.board_cases_a[2].value == 'O' || @board.board_cases_a[3].value == 'O' && @board.board_cases_a[4].value == 'O' && @board.board_cases_a[5].value == 'O') || (@board.board_cases_a[6].value == 'O' && @board.board_cases_a[7].value == 'O' && @board.board_cases_a[8].value == 'O') || (@board.board_cases_a[0].value == 'O'  && @board.board_cases_a[3].value == 'O' && @board.board_cases_a[6].value == 'O') || (@board.board_cases_a[1].value == 'O' && @board.board_cases_a[4].value == 'O' && @board.board_cases_a[7].value == 'O') || (@board.board_cases_a[2].value == 'O' && @board.board_cases_a[5].value == 'O' && @board.board_cases_a[8].value == 'O') || (@board.board_cases_a[0].value == 'O' && @board.board_cases_a[4].value == 'O' && @board.board_cases_a[8].value == 'O') || (@board.board_cases_a[2].value == 'O' && @board.board_cases_a[4].value == 'O' && @board.board_cases_a[6].value == 'O')
        puts "\n\n"
        puts "\n\n"
        puts "!!!!! Victoire de #{@players_a[0].name} !!!!!"
        puts "\n\n"
        return true
    else
      return false
    end
  end

  def new_round
    puts "Souhaitez vous rejouer une partie ? (y/n)"

    choice = gets.chomp

      while choice != "y" && choice != "n"
        puts "Veuillez choisir un des choix disponibles ! (y/n)"
        choice = gets.chomp
      end

      if choice == "y"
        @board = Board.new
        @status = "on going"
        @current_player = @players_a[0]
        self.turn
      else
        self.game_end
      end
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end
      puts "Fin de partie"
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  end    

end

# binding.pry