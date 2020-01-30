require_relative 'board.rb'

class Show
  def show_board(board)
    i = 0
    while i <= 2
      print "|#{board.board_cases_a[i].value}|"
      i += 1
    end
    puts "\n"
    while i <= 5
      print "|#{board.board_cases_a[i].value}|" 
      i+= 1
    end
    puts "\n"
    while i <= 8
      print "|#{board.board_cases_a[i].value}|" 
      i+= 1
    end
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
  end
end