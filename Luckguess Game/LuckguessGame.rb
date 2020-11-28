class Luckguess
    def initialize
     @letters =('a'..'z').to_a
     @word = words.sample
    #  Rule of my game --> Total lives will depend on your luck, it will vary from 4 to 7...That's why the 
    #  name of this game is "LuckguessGame".
     @lives = rand(3)+4
     @word_repeat = ""
    #  @word_initialize = ""
     @word_teaser = ""
    
     @word.first.size.times do
        @word_teaser += "_ "
     end
    end
    
    def words
    [
        ["penguin", "Group of aquatic flightless birds."],
        ["vatican", "Smallest city in the world by area."],
        ["dedication", "Committed to a task..."],
        ["cricket", "A game played by gentlemen"],
        ["jogging", "We are not walking..."],
        ["celebrate", "Remembering special moments"],
        ["continent", "There are 7 of these"],
        ["exotic", "Not from around here..."],
        ["funchal", "Home town City of Cristiano Ronaldo.."],
    ]        
    end
    
    def print_teaser last_guess = nil
        update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
    end
    
    def update_teaser last_guess
        new_teaser = @word_teaser.split
    
        new_teaser.each_with_index do |letter, index|
          # replace blank values with guessed letter if matches letter in word
          if letter == '_' && @word.first[index] == last_guess
            new_teaser[index] = last_guess
          end
        end
    
        @word_teaser = new_teaser.join(' ')
    end

    def make_guess
        if @lives>0
        puts "Enter a letter"
        guess=gets.chomp    

        good_guess =  @word.first.include? guess  
        good_guess2 =  @word_repeat.include? guess  
        if guess.size ==1
        @word_repeat += "#{guess}"
        end
        # --> good_guess = true if guess exist in the word , else good_guess false.

        if guess == "exit"
            puts "Thank you for playing!"
        elsif guess =="" || guess.size>1
            puts "Try some new letter.."
            make_guess
        elsif good_guess2
            puts "Ooops...Guess repeated!"
            make_guess
        elsif good_guess
            puts "Nice guess.."

            print_teaser guess 

            # if word completed by the player
            if @word.first == @word_teaser.split.join
                puts "Congrats....U won this game!"
            else
                make_guess
            end
        else 
            @lives -=1
            if(@lives > 0)
            puts "Sorry...you have #{ @lives } lives remain. Try again!"
            end
            make_guess    
        # else
        #     puts "Sorry you lost this round..See you in the next round."
        end
        else
            puts "Sorry you lost this round 0 lives remains..See you in the next round."
        end         
    end
    
    def begin
        
        puts "Let's start the game...Your word is #{@word.first.size} character long! "
        puts "To exit game at any point type 'EXIT' "
        
        puts "#{@word_teaser}"
        
        puts "Your Clue is : '#{@word.last}'"
        
        
        make_guess
        # putss "You guessed #{guess}"
    end
end

game = Luckguess.new
game.begin 