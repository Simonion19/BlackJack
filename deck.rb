require_relative './card.rb'

class Deck
  def initialize
    @cards = []

    Card::FACES.each do |face|
      if face.class == Integer
        value = face
      elsif face == 'A'
        value = 11
      else
        value = 10
      end

      Card::SUITS.each do |suit|
        @cards << Card.new(face, suit, value)
      end
    end
    
    shuffle_cards
  end
  
  def deal_cards(num, hand)
    num.times do
      card = @cards.pop
      hand.add_card(card)
      hand.score += card.value
      hand.ace_count += 1 if card.face == 'A'
    end
  end

  private
  
  def shuffle_cards
    @cards.shuffle!
  end
end