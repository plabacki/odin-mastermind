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
        puts array_of_guess   
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
        puts chosen_peg_of_colors    
    end
end        
    
#colorGenerator = ColorGuessGenerator.new()
#colorGenerator.generateGuess
player = Player.new()
puts player.generateGuess