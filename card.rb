require_relative './constants.rb'

class Card
  attr_accessor :face, :suit, :value

  FACES = FACES
  SUITS = SUITS

  def initialize face, suit, value
    @face = face
    @suit = suit
    @value = value
  end

  def show
    "#{@face}#{@suit} "
  end
end