require './question'
require './player'

class Game
  attr_reader :p1, :p2
  attr_accessor :q, :players

  def initialize(p1, p2)
    @p1 = Player.new(p1)
    @p2 = Player.new(p2)
    
    @q = Question.new(1, 20)
  end

  def new_game
    @players = [@p1, @p2]

    round_gameplay
    until self.winner?
      next_round
    end

  end

  def next_round
    puts "----- NEW TURN -----"
    self.players.rotate!
    round_gameplay
    
  end
  
  def round_gameplay
    # new question
    self.q.generate_question
    
    question = self.q.questions[-1][:question]
    answer = self.q.questions[-1][:answer]
    # ask question
    puts "#{self.players[0].name}: #{question}"
    input = gets.chomp
    
    if self.validate_answer(input, answer) == true
      puts self.players[0].opponent_correct
    else
      puts self.players[0].opponent_incorrect
      self.players[1].lose_life
    end
    self.display_lives
  end
  
  def validate_answer(input, answer)
    if input.to_i == answer
      return true
    else
      return false
    end
  end

  def display_lives
    puts "P1: #{self.p1.lives}/3 vs P2: #{self.p2.lives}/3"
  end

  def winner?
    self.p1.lives == 0 || self.p2.lives == 0
  end

  
end