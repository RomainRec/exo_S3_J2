require "pry"

class BoardCase
  attr_accessor :value, :case_number
  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)

  def initialize
    @value = value
    @case_number = case_number
    #TO DO doit régler sa valeur, ainsi que son numéro de case
  end
  
  def to_s
    @value.to_s #TO DO : doit renvoyer la valeur au format string
  end

end

class Board
  include Enumerable
  attr_accessor :array
  @@count = 1
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

    @array = [@a1.value, @a2.value, @a3.value, @b1.value, @b2.value, @b3.value, @c1.value, @c2.value, @c3.value]
    
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
  end

 def player_one
    # Méthode qui change la valeur ("", 0 ou X) de la BoardCase en fonction du choix du joueur qui a les X pour refléter sont coup
    puts "joueur 1 choisis une case:"
    x = gets.chomp.to_i
    case x
      when 1 
          @a1.value = "X" 
        display

      when 2 
        @a2.value = "X"
          display
      when 3 
        @a3.value = "X"
          display
      when 4 
        @b1.value = "X"
          display
      when 5 
        @b2.value = "X"
          display
      when 6 
        @b3.value = "X"
          display
      when 7 
        @c1.value = "X"
          display
      when 8 
        @c2.value = "X"
          display
      when 9 
        @c3.value = "X"
          display
      else puts "la case est déjà prise"
        player_one
      end
    victory? # on vérifie si une combinaison gagnante a été obtenue
    @@count += 1
    if @@count <= 9
    player_two # on passe au joueur 2
  else 
    display
    puts "Egalité!" #Cas où les 9 coups ont été joués sans qu'il n'y ait de vainqueur
  end
end

  def player_two
    # # Méthode qui change la valeur ("", 0 ou X) de la BoardCase en fonction du choix du joueur qui a les 0 pour refléter sont coup
    puts "joueur 2 choisis une case:"
    x = gets.chomp.to_i
    case x
      when 1 
        @a1.value = "O"
          display
      when 2 
        @a2.value = "O"
          display
      when 3 
        @a3.value = "O"
          display
      when 4
        @b1.value = "O"
          display
      when 5 
        @b2.value = "O"
          display
      when 6
        @b3.value = "O"
          display
      when 7 
        @c1.value = "O"
          display
      when 8
        @c2.value = "O"
          display
      when 9 
        @c3.value = "O"
          display
      else puts "la case est déjà prise"
        player_two
      end
    victory? # on vérifie si une combinaison gagnate a été obtenue
    @@count += 1
    if @@count <= 9
    player_one # on repasse au joueur 1
  else
    display #Cas où les 9 coups ont été joués sans qu'il n'y ait de vainqueur
    puts "Egalité!"
  end
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
      if @a1.value == "X" && @a2.value == "X" && @a3.value == "X" || @a1.value == "X" && @b2.value == "X" && @c3.value == "X"||
         @a1.value == "X" && @b1.value == "X" && @c1.value == "X" || @a2.value == "X" && @b2.value == "X" && @c2.value == "X"||
         @a3.value == "X" && @b3.value == "X" && @c3.value == "X" || @b1.value == "X" && @b2.value == "X" && @b3.value == "X"||
         @c1.value == "X" && @c2.value == "X" && @c3.value == "X" || @c1.value == "X" && @b2.value == "X" && @a3.value == "X"
      puts "VICTORYYYYY ! "
      exit
      end
      # LE O GAGNE 
      if @a1.value == "O" && @a2.value == "O" && @a3.value == "O" || @a1.value == "O" && @b2.value == "O" && @c3.value == "O"||
         @a1.value == "O" && @b1.value == "O" && @c1.value == "O" || @a2.value == "O" && @b2.value == "O" && @c2.value == "O"||
         @a3.value == "O" && @b3.value == "O" && @c3.value == "O" || @b1.value == "O" && @b2.value == "O" && @b3.value == "O"||
         @c1.value == "O" && @c2.value == "O" && @c3.value == "O" || @c1.value == "O" && @b2.value == "O" && @a3.value == "O"
      puts "VICTORYYYYY ! "
      exit
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

  def lancement
      #affiche le tableau
      puts "LE JEU COMMENCE !!!!"
      puts "Voici le plateau de jeu : "
      puts "_____________"
      puts "| 1 | 2 | 3 |"
      puts "|-----------|"
      puts "| 4 | 5 | 6 |"
      puts "|-----------|"
      puts "| 7 | 8 | 9 |"
      puts "-------------"
  lancement = Board.new
  lancement.player_one

  end

    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
  


#Game.new.go
end
binding.pry 

