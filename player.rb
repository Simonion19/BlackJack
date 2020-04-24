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
    @hand.ace_score_check
  end
end