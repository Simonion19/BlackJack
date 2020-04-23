require_relative './constants'

class Bank
  attr_accessor :money

  START_AMOUNT = START_AMOUNT
  BET = BET

  def initialize
    @money = 0
  end

  def set_start_amount
    @money = START_AMOUNT
  end

  def bet
    @money -= BET
  end

  def return_bet
    @money += BET
  end

  def get_a_win(win)
    @money += win
  end

  def get_total_bet
    BET * 2
  end
end