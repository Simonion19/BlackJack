require_relative './player.rb'
require_relative './dealer.rb'
require_relative './hand.rb'
require_relative './deck.rb'
require_relative './card.rb'

require_relative './interface.rb'

class Game
  attr_accessor :deck, :dealer, :player, :total_bet

  def initialize
    @interface = Interface.new

    start!
  end

  def start!
    @dealer = Dealer.new 'dealer'
    @player = Player.new 'player'

    round
  end

  def round
    while @dealer.bank.money > 0 && @player.bank.money > 0
      start_round

      @interface.show_hidden_hand(@dealer)
      @interface.show_hand(@player)
      @interface.show_score(@player)

      @interface.show_question_to_hit
      enter = gets.chomp.to_i
      if enter == 1
        @player.hit(@deck)
      end

      @dealer.score_check(@deck)

      @interface.show_total_bet(@total_bet)
      @interface.show_hand(@dealer)
      @interface.show_score(@dealer)
      @interface.show_hand(@player)
      @interface.show_score(@player)
      @interface.show_winner(end_round)
      @interface.show_bank(@dealer)
      @interface.show_bank(@player)

      @interface.show_question_to_continue
      enter = gets.chomp.to_i
      if enter == 1
        next
      else
        break
      end
    end
  end

  def start_round
    @deck = Deck.new
    @bank = Bank.new

    @total_bet = 0

    @dealer.hand.free_hand
    @player.hand.free_hand

    @dealer.hand.score = 0
    @player.hand.score = 0

    @dealer.bank.bet
    @player.bank.bet

    @total_bet = @bank.get_total_bet

    @deck.deal_cards(2, @dealer.hand)
    @deck.deal_cards(2, @player.hand)
  end

  def end_round
    dealer_score = @dealer.hand.score
    player_score = @player.hand.score

    if dealer_score <= 21 && player_score <= 21
      if dealer_score > player_score
        give_total_bet(@dealer, @bank.get_total_bet)
        @dealer.name
      elsif dealer_score < player_score
        give_total_bet(@player, @bank.get_total_bet)
        @player.name
      elsif dealer_score == player_score
        @player.bank.return_bet
        @dealer.bank.return_bet
        false
      end
    elsif dealer_score <= 21 && player_score > 21
      give_total_bet(@dealer, @bank.get_total_bet)
      @dealer.name
    elsif dealer_score > 21 && player_score <= 21
      give_total_bet(@player, @bank.get_total_bet)
      @player.name
    elsif dealer_score > 21 && player_score > 21
      @player.bank.return_bet
      @dealer.bank.return_bet
      false
    end
  end

  def give_total_bet(player, total_bet)
    player.bank.get_a_win(total_bet)
  end
end

game = Game.new