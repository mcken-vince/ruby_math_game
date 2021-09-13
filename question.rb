class Question
  def initialize(min, max)
    @min = min
    @max = max
    @questions = []
  end

  def generate_number
    rand(@min...@max + 1)
  end

  def generate_question
    num1 = self.generate_number
    num2 = self.generate_number
    @questions << { question: "What does #{num1} + #{num2} equal?", answer: (num1 + num2) }
  end
end