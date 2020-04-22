class Player
  attr_accessor :name, :hand, :bank, :score, :ace_count

  def initialize name
    @name = name
    @hand = []
    @bank = 100
    @score = 0
    @ace_count = 0
  end

  def switch_ace_value
    @score -= 10
    @ace_count -=1
  end

  def free_hand
    @hand = []
  end
end