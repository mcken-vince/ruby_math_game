class Player
  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def opponent_correct
    "You got it, that's right!"
  end

  def opponent_incorrect
    "What? No that's totally wrong."
  end

  def lose_life
    self.lives -= 1
  end

end