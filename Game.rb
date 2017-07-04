# Description
# Create a 2-Player math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.
require ('./Question.rb')
require ('./Player.rb')

puts "Welcome to a fun 2-player Math Game!"
class Game
  attr_reader :players

  def initialize()
    @players = [Player.new(1), Player.new(2)]
  end

  def play()
    # player[0]'s turn'
    turn = 0
    # if one player's lives drops to zero, then the game is over
    while (@players[0].lives > 0 && @players[1].lives > 0)
      puts "----- NEW TURN -----"
      # ask question from question.rb and compares answer
      @question = Question.new

      @question.printQuestion(@players[turn].id)

      input = gets.chomp

      if (!@question.checkAnswer(@players[turn].id, input.to_i))
        @players[turn].lose_life()
      end

      puts "P1: #{@players[0].lives}/3 vs. P2: #{@players[1].lives}/3"
      #whose turn is it? Change to the other player after round is over.
      if (turn == 0)
        # if last turn was player[0], switch to player[1]'s turn
        turn = 1
      else
        turn = 0
      end
    end
    puts "Player #{@players[turn].id} wins with a score of #{@players[turn].lives}/3"
    puts "-----GAME OVER-----"
    puts "Good bye!"
  end

  game = Game.new
  game.play()
end
