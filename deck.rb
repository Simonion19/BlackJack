require_relative './card.rb'

class Deck
  def initialize
    @faces = [*(2..10), 'J', 'Q', 'K', 'A']
    @suits = ['+', '<3', '^', '<>']
    @cards = []

    @faces.each do |face|
      if face.class == Integer
        value = face
      elsif face == 'A'
        value = 11
      else
        value = 10
      end

      @suits.each do |suit|
        @cards << Card.new(face, suit, value)
      end
    end
  end

  def shuffle_cards
    @cards.shuffle!
  end

  def deal_cards(num, player)
    num.times do
      card = @cards.pop
      player.hand << card
      player.score += card.value
      card.face == 'A' ? player.ace_count += 1 : nil
    end
  end
end