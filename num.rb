require 'colorize'
class Game
  def initialize
    @number = rand(1..20)
    @streak = 0
  end
  def start
    puts "Can you ".light_blue + "Guess the Number!".yellow.bold
    puts "I'm thinking of a number between 1 and 20...\n".light_black
    sleep 0.5
    attempts = 0
    loop do
      print "👉  Your guess: ".green
      guess = gets.to_i
      attempts += 1
      if guess < @number
        puts "Too low!".light_red
      elsif guess > @number
        puts "Too high!".red
      else
        print "\n"
        10.times do
          print "★".yellow
          sleep 0.05
        end
        puts "\n"
        puts "Congrats! You guessed it in ".light_green +
             "#{attempts}".cyan.bold +
             " attempts.".light_green
        @streak += 1
        puts "Streak: #{@streak}".magenta.bold
        break unless play_again?
        reset_game
      end
    end
  end
  def play_again?
    print "\nPlay again? (y/n): ".light_blue
    answer = gets.chomp.downcase
    answer == 'y'
  end
  def reset_game
    @number = rand(1..20)
    puts "\nNew number generated! Let's go again!".yellow
  end
end
game = Game.new
game.start
