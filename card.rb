class Card
  attr_accessor :face, :suit, :value

  FACES = [*(2..10), 'J', 'Q', 'K', 'A'].freeze
  SUITS = ['+', '<3', '^', '<>'].freeze

  def initialize(face, suit, value)
    FACES.include?(face) ? @face = face : (raise 'Invalid face!')
    SUITS.include?(suit) ? @suit = suit : (raise 'Inavlid suit!')
    @value = value
  end

  def show
    "#{@face}#{@suit} "
  end
end