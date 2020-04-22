require_relative './game.rb'

class Interface
  def initialize
    @game = Game.new
    @game.start!

    @dealer = @game.dealer
    @player = @game.player

    while @dealer.bank > 0 && @player.bank > 0
      @game.start_round

      @deck = @game.deck

      show_hidden_hand(@dealer)
      puts "\n"
      show_hand(@player)
      show_score(@player)
      puts 'Введите 1, чтобы взять карту'
      puts 'Введите 0, чтобы пропустить'
      enter = gets.chomp.to_i

      if enter == 1
        @deck.deal_cards 1, @player
        if @player.score > 21 && @player.ace_count > 0
          @player.switch_ace_value
        end
      end

      if @dealer.score < 17 
        @deck.deal_cards 1, @dealer
        if @dealer.score > 21 && @dealer.ace_count > 0
          @dealer.switch_ace_value
        end
      end

      show_total_bet
      print 'Dealer: '
      show_hand(@dealer)
      show_score(@dealer)
      print 'Player: '
      show_hand(@player)
      show_score(@player)

      show_winner(@game.end_round)
      show_bank(@dealer)
      show_bank(@player)
      puts "\n"

      puts 'Введите 1, чтобы продолжить'
      puts 'Введите 0, чтобы остановить'

      enter = gets.chomp.to_i

      if enter == 1
        next
      else
        break
      end
    end
    puts 'Game Over'
  end

  def show_hand(player)
    player.hand.each do |card|
      print card.show
    end
  end

  def show_hidden_hand(player)
    player.hand.each do |card|
      print '*'
    end
  end

  def show_score(player)
    puts "Score: #{player.score}"
  end

  def show_total_bet
    puts "Total bet: #{@game.total_bet}"
  end

  def show_bank(player)
    puts "#{player.name} bank: #{player.bank}"
  end

  def show_winner(name)
    if name
      puts "Win: #{name}"
    else
      puts "Draw"
    end
  end
end

interface = Interface.new