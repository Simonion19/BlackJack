require_relative './player.rb'

class Dealer < Player
  def score_check(deck)
    if @dealer.score < 17 
      hit(deck)
    end
  end
end