require_relative './player.rb'
require_relative './deck.rb'
require_relative './card.rb'

class Game
  attr_accessor :deck, :dealer, :player, :total_bet

  def start!
    @dealer = Player.new 'dealer'
    @player = Player.new 'player'
  end

  def start_round
    @deck = Deck.new
    @deck.shuffle_cards
    @total_bet = 0

    @dealer.free_hand
    @player.free_hand

    @dealer.score = 0
    @player.score = 0

    @dealer.bank -= 10
    @player.bank -= 10

    @total_bet = 20

    @deck.deal_cards 2, @dealer
    @deck.deal_cards 2, @player
  end

  def end_round
    if @dealer.score <= 21 && @player.score <= 21
      if @dealer.score > @player.score
        give_total_bet(@dealer)
        @dealer.name
      elsif @dealer.score < @player.score
        give_total_bet(@player)
        @player.name
      elsif @dealer.score == @player.score
        reset_bet
        false
      end
    elsif @dealer.score <= 21 && @player.score > 21
      give_total_bet(@dealer)
      @dealer.name
    elsif @dealer.score > 21 && @player.score <= 21
      give_total_bet(@player)
      @player.name
    elsif @dealer.score > 21 && @player.score > 21
      reset_bet
      false
    end
  end

  def reset_bet
    @player.bank += 10
    @dealer.bank += 10
  end

  def give_total_bet(player)
    player.bank += @total_bet
  end
end