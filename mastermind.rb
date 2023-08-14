class ColorGuessGenerator

    attr_accessor :posibble_colors, :array_of_guess

    def initialize
        @posibble_colors = {1 => "blue", 2 => "red", 3 => "green", 4 => "yellow", 5 => "purple", 6 => "orange"}
        @array_of_guess = []
    end
    
    def generateGuess
        number_of_color_to_guess = 4
        number_of_color_to_guess.times do
            color_guessed = posibble_colors[rand(1..6)]
            array_of_guess.push(color_guessed)
        end
        return array_of_guess   
    end
end

class Player

    attr_accessor :chosen_peg_of_colors

    def initialize
        @chosen_peg_of_colors = []
    end

    def generateGuess
        number_of_color_to_guess = 4
        number_of_color_to_guess.times do
            color_guessed = gets.chomp
            chosen_peg_of_colors.push(color_guessed) 
        end
        return chosen_peg_of_colors    
    end
end        

class Game

    attr_accessor :player_guess, :computer_guess, :hints, :number_of_correct_guess

    def initialize(computer_guess)
        @player_guess = player_guess
        @computer_guess = computer_guess
        @hints = []
        @number_of_correct_guess = 0;
    end
    
    def check_answer(player_guess)
        for i in 0..player_guess.length-1
            if player_guess[i] == computer_guess[i]
                hints[i] = "black"
                number_of_correct_guess += 1
            elsif player_guess[i] != computer_guess[i] && computer_guess.include?(player_guess[i])
                hints[i] = "white"
            else
                hints[i] = "gray"        
            end
        end
        print "player: #{player_guess}\nwskazowki: #{hints}\nodpowiedzi #{computer_guess}\n"
    end
    def game 
        until number_of_correct_guess == 4 do
            player_guess = Player.new().generateGuess
            puts number_of_correct_guess
            check_answer(player_guess)
        end    
    end    
end            
#colorGenerator = ColorGuessGenerator.new()
#colorGenerator.generateGuess
#player = Player.new()
#puts player.generateGuess

game = Game.new(ColorGuessGenerator.new().generateGuess)
game.game