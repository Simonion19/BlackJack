class Card
  attr_accessor :face, :suit, :value

  def initialize face, suit, value
    @face = face
    @suit = suit
    @value = value
  end

  def show
    "#{@face}#{@suit}"
  end
end