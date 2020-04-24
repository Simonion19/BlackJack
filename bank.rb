class Bank
  attr_accessor :money

  START_AMOUNT = 100
  BET = 10

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

  def get_a_win
    @money += get_total_bet
  end

  def get_total_bet
    BET * 2
  end
end