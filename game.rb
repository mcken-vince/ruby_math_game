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

  # puts players into array, calls gameplay and loops new rounds until there is a winner
  def new_game
    @players = [@p1, @p2]

    round_gameplay
    until self.winner?
      next_round
    end

  end

  # handles delay, rotates players, initiates new round
  def next_round
    sleep(1)
    puts "\n----- NEW TURN -----"
    self.players.rotate!
    round_gameplay
  end
  
  # handles gameplay in each round
  def round_gameplay
    # new question
    self.q.generate_question
    
    question = self.q.questions[-1][:question]
    answer = self.q.questions[-1][:answer]
    questioner = self.players[0]
    # ask question
    puts "#{questioner.name}: #{question}"
    input = gets.chomp
    
    if self.answer_correct?(input, answer) == true
      puts "#{questioner.name}: #{questioner.opponent_correct}"
    else
      puts "#{questioner.name}: #{questioner.opponent_incorrect}"
      self.players[1].lose_life
    end

    if self.winner?
      # if there is a winner declare the winner and call game over
      self.declare_winner(self.players[0])
      self.game_over
    else
      # otherwise display both players scores and carry on
      self.display_lives
    end
  end
  
  def answer_correct?(input, answer)
    input.to_i == answer ? true : false
  end

  def display_lives
    puts "P1: #{self.p1.lives}/3 vs P2: #{self.p2.lives}/3"
  end

  def winner?
    self.p1.lives == 0 || self.p2.lives == 0
  end

  def declare_winner(winner)
    puts "\n#{winner.name} wins with a score of #{winner.lives}/3"
  end

  def game_over
    puts "----- GAME OVER -----"
  end
end