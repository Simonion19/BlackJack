class Hand
  attr_accessor :cards, :score, :ace_count

  def initialize
    @cards = []
    @ace_count = 0
    @score = 0
  end

  def add_card(card)
    @cards << card
  end

  def switch_ace_value
    @score -= 10
    @ace_count -=1
  end

  def free_hand
    @cards = []
  end
end