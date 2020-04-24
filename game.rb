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
    @interface.show_question_to_enter_name
    enter = gets.chomp.to_s

    @player = Player.new enter
    @dealer = Dealer.new 'dealer'

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

    @dealer.hand.reset_score
    @player.hand.reset_score

    @dealer.bank.bet
    @player.bank.bet

    @total_bet = @bank.get_total_bet

    @deck.deal_cards(2, @dealer.hand)
    @deck.deal_cards(2, @player.hand)

    @dealer.hand.ace_score_check
    @player.hand.ace_score_check
  end

  def end_round
    dealer_score = @dealer.hand.score
    player_score = @player.hand.score

    if dealer_score <= 21 && player_score <= 21
      if dealer_score > player_score
        give_total_bet(@dealer)
        @dealer.name
      elsif dealer_score < player_score
        give_total_bet(@player)
        @player.name
      elsif dealer_score == player_score
        @player.bank.return_bet
        @dealer.bank.return_bet
        false
      end
    elsif dealer_score <= 21 && player_score > 21
      give_total_bet(@dealer)
      @dealer.name
    elsif dealer_score > 21 && player_score <= 21
      give_total_bet(@player)
      @player.name
    elsif dealer_score > 21 && player_score > 21
      @player.bank.return_bet
      @dealer.bank.return_bet
      false
    end
  end

  def give_total_bet(player)
    player.bank.get_a_win
  end
end

game = Game.new