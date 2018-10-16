require "pry"

class BoardCase
#La classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)
  attr_accessor :value, :case_number
  

  #On règle sa valeur, ainsi que son numéro de case
  def initialize
    @value = value
    @case_number = case_number
  end

  #On renvoiela valeur au format string
  def to_s
    @value.to_s
  end

end

class Board
  #La classe a 1 attr_accessor, une array qui contient les BoardCases
  #count sert à compter les tours
  include Enumerable
  attr_accessor :array
  @@count = 1

  #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
  #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
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

    @array = [@a1.value = nil , @a2.value  = nil, @a3.value = nil , @b1.value = nil , @b2.value = nil , @b3.value = nil , @c1.value = nil , @c2.value = nil , @c3.value = nil ]
  end

 def player_one
    # Le Joueur 1 va commencer à jouer. Si la case est déjà prise, il ne pourra pas jouer sur la même. Il sera invité à rejouer
    puts "Joueur 1 : choisis une case stp !"
    x = gets.chomp.to_i
    case x
      when 1 
        if @a1.value == "X" || @a1.value == "O"
          puts "la case est déjà prise"
          player_one
        else @a1.value = "X" 
        end
        display
      when 2 
        if @a2.value == "X" || @a2.value == "O"
          puts "la case est déjà prise"
          player_one
        else @a2.value = "X" 
        end
        display
      when 3 
        if @a3.value == "X" || @a3.value == "O"
          puts "la case est déjà prise"
          player_one
        else @a3.value = "X" 
        end
        display
      when 4 
        if @b1.value == "X" || @b1.value == "O"
          puts "la case est déjà prise"
          player_one
        else @b1.value = "X" 
        end
        display
      when 5 
         if @b2.value == "X" || @b2.value == "O"
          puts "la case est déjà prise"
          player_one
        else @b2.value = "X" 
        end
        display
      when 6 
         if @b3.value == "X" || @b3.value == "O"
          puts "la case est déjà prise"
          player_one
        else @b3.value = "X" 
        end
        display
      when 7 
           if @c1.value == "X" || @c1.value == "O"
          puts "la case est déjà prise"
          player_one
        else @c1.value = "X" 
        end
        display
      when 8 
            if @c2.value == "X" || @c2.value == "O"
          puts "la case est déjà prise"
          player_one
        else @c2.value = "X" 
        end
        display
      when 9 
        if @c3.value == "X" || @c3.value == "O"
          puts "la case est déjà prise"
          player_one
        else @c3.value = "X" 
        end
        display
      end
    #On vérifie si le joueur a gagné
    victory? 
    #On vérifie si on a rempli les 9 cases
    @@count += 1
    if @@count <= 9
    #On passe au joueur 2
    player_two
  else 
    # Si les 9 cases sont pleines mais qu'il n'y a pas de vaiqueur : égalité !
    display
    puts "Egalité!"
  end
end

  def player_two
    # Le Joueur 2 va à jouer. Si la case est déjà prise, il ne pourra pas jouer sur la même. Il sera invité à rejouer
    puts "joueur 2 choisis une case:"
    x = gets.chomp.to_i
    case x
      when 1 
        if @a1.value == "X" || @a1.value == "O"
          puts "la case est déjà prise"
          player_two
        else @a1.value = "O" 
        end
        display
      when 2 
        if @a2.value == "X" || @a2.value == "O" 
          puts "la case est déjà prise"
          player_two
        else @a2.value = "O" 
        end
        display
      when 3 
        if @a3.value == "X" || @a3.value == "O"
          puts "la case est déjà prise"
          player_two
        else @a3.value = "O" 
        end
        display
      when 4 
        if @b1.value == "X" || @b1.value == "O"
          puts "la case est déjà prise"
          player_two
        else @b1.value = "O" 
        end
        display
      when 5 
         if @b2.value == "X" || @b2.value == "O"
          puts "la case est déjà prise"
          player_two
        else @b2.value = "O" 
        end
        display
      when 6 
         if @b3.value == "X" || @b3.value == "O"
          puts "la case est déjà prise"
          player_two
        else @b3.value = "O" 
        end
        display
      when 7 
           if @c1.value == "X" || @c1.value == "O"
          puts "la case est déjà prise"
          player_two
        else @c1.value = "O" 
        end
        display
      when 8 
            if @c2.value == "X" || @c2.value == "O"
          puts "la case est déjà prise"
          player_two
        else @c2.value = "O" 
        end
        display
      when 9 
        if @c3.value == "X" || @c3.value == "O"
          puts "la case est déjà prise"
          player_two
        else @c3.value = "O" 
        end
      end
    victory?
    @@count += 1
    if @@count <= 9
    #On passe au joueur 1
    player_one
  else
    display
    puts "Egalité!"
  end
end
  
  #Affichage du jeu
  def display
    puts "  #{@a1}  |  #{@a2}  |  #{@a3}  "
    puts "--------------"
    puts "  #{@b1}  |  #{@b2}  |  #{@b3}  "
    puts "--------------"
    puts "  #{@c1}  |  #{@c2}  |  #{@c3}  "
    puts " "
  #TO DO : afficher le plateau

  end

  # Conditions de victoire
  def victory?
      # LE X GAGNE 
      if @a1.value == "X" && @a2.value == "X" && @a3.value == "X" || @a1.value == "X" && @b2.value == "X" && @c3.value == "X"||
         @a1.value == "X" && @b1.value == "X" && @c1.value == "X" || @a2.value == "X" && @b2.value == "X" && @c2.value == "X"||
         @a3.value == "X" && @b3.value == "X" && @c3.value == "X" || @b1.value == "X" && @b2.value == "X" && @b3.value == "X"||
         @c1.value == "X" && @c2.value == "X" && @c3.value == "X" || @c1.value == "X" && @b2.value == "X" && @a3.value == "X"
      puts "Bravo, les X ont gagné ! "
      exit
      end
      # LE O GAGNE 
      if @a1.value == "O" && @a2.value == "O" && @a3.value == "O" || @a1.value == "O" && @b2.value == "O" && @c3.value == "O"||
         @a1.value == "O" && @b1.value == "O" && @c1.value == "O" || @a2.value == "O" && @b2.value == "O" && @c2.value == "O"||
         @a3.value == "O" && @b3.value == "O" && @c3.value == "O" || @b1.value == "O" && @b2.value == "O" && @b3.value == "O"||
         @c1.value == "O" && @c2.value == "O" && @c3.value == "O" || @c1.value == "O" && @b2.value == "O" && @a3.value == "O"
      puts "Bravo, les 0 ont gagné ! "
      exit
      end
  end
end


class Player
 attr_accessor :name_player
  
  def initialize
    @name_player = name_player
  end
end 


class Game
 def initialize
      # On a deux joueurs
      player1 = Player.new
      player2 = Player.new
       puts "Bienvenue sur Tic-Tac-Toe !!"
       #les joueurs entrent leurs noms
       puts "Bonjour, quel est votre nom joueur 1 ?"
       player1.name_player = gets.chomp
       puts "Bonjour, quel est votre nom joueur 2 ? "
       player2.name_player = gets.chomp

       puts " "
       puts "Bonjour #{player1.name_player} et #{player2.name_player}, nous sommes prêts à commencer "
       puts "#{player1.name_player} tu auras les : X. #{player2.name_player} tu auras les : O "
       puts " "

  end


  def go
      #Affiche le plateau de jeu avec les numéros correspondant à chaque case
      puts "LE JEU COMMENCE !!!!"
      puts "Voici le plateau de jeu :"
      puts " "
      puts "_____________"
      puts "| 1 | 2 | 3 |"
      puts "|-----------|"
      puts "| 4 | 5 | 6 |"
      puts "|-----------|"
      puts "| 7 | 8 | 9 |"
      puts "-------------"
      puts " "
  go = Board.new
  go.player_one

  end
end

Game.new.go
