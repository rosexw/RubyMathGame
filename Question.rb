class Question
  attr_accessor :answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end

  def checkAnswer(id, input)

    #compares real answer to player input
    if (@answer == input)
      puts "Player #{id}: YES! You are correct."
      return true
    elsif (@answer != input)
      puts "Player #{id}: Seriously? No!"
      return false
    else
      puts "Player #{id}: Please input a number."
    end
  end

  def printQuestion(id)
    puts "Player #{id}: What does #{@num1} plus #{@num2} equal?"
  end
end
