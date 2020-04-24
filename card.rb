class Card
  attr_accessor :face, :suit, :value

  FACES = [*(2..10), 'J', 'Q', 'K', 'A'].freeze
  SUITS = ['+', '<3', '^', '<>'].freeze

  def initialize(face, suit, value)
    validate!(face, suit)
    @face = face
    @suit = suit
    @value = value
  end

  def validate!(face, suit)
    raise 'Invalid face!' if !FACES.include?(face)
    raise 'Inavlid suit!' if !SUITS.include?(suit)
  end

  def show
    "#{@face}#{@suit} "
  end
end