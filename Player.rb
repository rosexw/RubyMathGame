class Player
  attr_accessor :id, :lives
  def initialize(id)
    @id = id
    @lives = 3
  end

  def lose_life()
    @lives = @lives - 1
  end
end
