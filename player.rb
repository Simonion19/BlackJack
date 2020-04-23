require_relative './bank.rb'
require_relative './hand.rb'

class Player
  attr_accessor :name, :hand, :bank

  def initialize(name)
    @name = name
    @hand = Hand.new
    @bank = Bank.new
    @bank.set_start_amount
  end

  def hit(deck)
    deck.deal_cards(1, @hand)
    if @hand.score > 21 && @hand.ace_count > 0
      @hand.switch_ace_value
    end
  end
end