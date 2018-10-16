require "pry"

class BoardCase
  attr_accessor :valeur, :case_number
  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)

  def initialize
    @valeur = valeur
    @case_number = case_number
    #TO DO doit régler sa valeur, ainsi que son numéro de case
  end
  
  def to_s
    @valeur.to_s #TO DO : doit renvoyer la valeur au format string
  end

end

class Board
  include Enumerable
  attr_accessor :array
  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases


  def initialize
    @a1 = BoardCase.new
    @a2 = BoardCase.new
    @a3 = BoardCase.new
    @b1 = BoardCase.new
    @b2 = BoardCase.new
    @b3 = BoardCase.new
    @c1 = BoardCase.new
    @c2 = BoardCase.new
    @c3 = BoardCase.new

    @array = [@a1.valeur, @a2.valeur, @a3.valeur, @b1.valeur, @b2.valeur, @b3.valeur, @c1.valeur, @c2.valeur, @c3.valeur]
    
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
  end

  def display
    puts "_________"
    puts "|#{@a1} | #{@a2} | #{@a3}|"
    puts "|_______|"
    puts "|#{@b1} | #{@b2} | #{@b3}|"
    puts "|_______|"
    puts "|#{@c1} | #{@c2} | #{@c3}|"
    puts "|_______|"
  #TO DO : afficher le plateau

  end

  def victory?
      # LE X GAGNE 
      if array[0] == "X" && array[1] == "X" && array[2] == "X" || array[3] == "X" && array[4] == "X" && array[5] == "X"||
         array[6] == "X" && array[7] == "X" && array[8] == "X" || array[0] == "X" && array[3] == "X" && array[6] == "X"||
         array[1] == "X" && array[4] == "X" && array[7] == "X" || array[2] == "X" && array[5] == "X" && array[8] == "X"||
         array[0] == "X" && array[4] == "X" && array[8] == "X" || array[6] == "X" && array[4] == "X" && array[2] == "X"
      return true
      end
      # LE O GAGNE 
      if array[0] == "O" && array[1] == "O" && array[2] == "O" || array[3] == "O" && array[4] == "O" && array[5] == "O"||
         array[6] == "O" && array[7] == "O" && array[8] == "O" || array[0] == "O" && array[3] == "O" && array[6] == "O"||
         array[1] == "O" && array[4] == "O" && array[7] == "O" || array[2] == "O" && array[5] == "O" && array[8] == "O"||
         array[0] == "O" && array[4] == "O" && array[8] == "O" || array[6] == "O" && array[4] == "O" && array[2] == "O"
      return true
      end
  end
end

class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
 attr_accessor :name_player, :valeur_player
 attr_writer :win
  
  def initialize
    #TO DO : doit régler son nom, sa valeur, son état de victoire
    @name_player = name_player
    @valeur_player = valeur_player
    #@win = (def victory?)
  end

end 

class Game
 
 def initialize
      player1 = Player.new
      player2 = Player.new
       print "Bienvenue sur Tic-Tac-Toe !!"
       #les joueurs entrent leurs noms
       print "Bonjour, quel est votre nom joueur 1 ?"
       player1.name_player = gets.chomp
       print "Bonjour, quel est votre nom joueur 2 ? "
       player2.name_player = gets.chomp

       puts "Bonjour #{player1.name_player} et #{player2.name_player}, nous sommes prêts à commencer "
       puts "#{player1.name_player} tu auras les X. #{player2.name_player} tu auras les O "

  end

  #def go



    # TO DO : lance la partie
  #end

  def turn 
      #affiche le tableau
    puts "_____________"
    puts "| 1 | 2 | 3 |"
    puts "|-----------|"
    puts "| 4 | 5 | 6 |"
    puts "|-----------|"
    puts "| 7 | 8 | 9 |"
    puts "-------------"

    victoire = Board.new
    test_victoire = victoire.victory?

    until test_victoire == true
      puts "A toi de jouer, choisi le numéro de ta case"
      x = gets.chomp.to_i
      tour = Board.new
      tour1 = tour.play

      #@array[0] = 1
      #@array[1] = 2
      #@array[2] = 3
      #@array[3] = 4
      #@array[4] = 5
      #@array[5] = 6
      #@array[6] = 7
      #@array[7] = 8
      #@array[8] = 9

end
def play
      i=0
      until i > 8
        if @array[i] == nil
           puts @array[i] = @valeur 
        elsif  
          @array[i] == @valeur  
           puts "recommence"
        end
         i += 1
      end
  end

    end



    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
  end

  end

#Game.new.go

binding.pry 

