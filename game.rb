require './question'

class Game
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @q = Question.new(1, 20)
  end

  def new_game
    self.next_round
  end

  def next_round
    puts "----- NEW TURN -----"
    
    puts @q.generate_question
    
  end
end