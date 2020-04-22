class Player
  attr_accessor :hand, :bank, :score, :ace_count

  def initialize name, bank = 100, score = 0
    @name = name
    @hand = []
    @bank = bank
    @score = score
    @ace_count = 0
  end

  def switch_ace_value
    @score -= 10
    @ace_count -=1
  end
end