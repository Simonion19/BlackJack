class Interface
  def show_hand(player)
    print "#{player.name}: "
    player.hand.cards.each do |card|
      print card.show
    end
  end

  def show_hidden_hand(player)
    print "#{player.name}: "
    player.hand.cards.each do |card|
      print '*'
    end
    puts "\n"
  end

  def show_score(player)
    puts "Score: #{player.hand.score}"
  end

  def show_total_bet(total_bet)
    puts "Total bet: #{total_bet}"
  end

  def show_bank(player)
    puts "#{player.name} bank: #{player.bank.money}"
  end

  def show_question_to_enter_name
    puts 'Введите имя игрока'
  end

  def show_question_to_hit
    puts 'Введите 1, чтобы взять карту'
    puts 'Введите 0, чтобы пропустить'
  end

  def show_question_to_continue
    puts 'Введите 1, чтобы продолжить'
    puts 'Введите 0, чтобы остановить'
  end

  def show_winner(name)
    if name
      puts "Win: #{name}"
    else
      puts "Draw"
    end
  end
end