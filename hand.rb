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

  def ace_score_check
    while @score > 21 && @ace_count > 0
      switch_ace_value
    end
  end

  def switch_ace_value
    @score -= 10
    @ace_count -=1
  end

  def free_hand
    @cards = []
  end

  def reset_score
    @score = 0
  end
end