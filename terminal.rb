class Terminal
  def initialize(game)
    @game = game
  end
  
  def start_game
    loop do
      @game.init
      loop do
        print_status
        print_actions
        @game.turn(action)
        break if @game.end?
      end
      print_status
      break unless continue?
    end
  end

  def self.get_name
    system('clear')
    puts "Ваше имя?"
    gets.chomp
  end

  private

  def action
    return(@game.actions[0]) \
      if @game.actions.size == 1
    loop do
      print '> '
      answer = gets.chomp.to_i
      return(@game.actions[answer - 1]) \
        if (1..@game.actions.size).include?(answer)
    end
  end

  def print_status
    system('clear')
    print_gamer(@game.gamer1)
    print_gamer(@game.gamer2)
    if @game.status == :end
      if @game.winner
        puts "Победил #{@game.winner.name}!"
      else
        puts "Ничья!"
      end
    end
  end

  def print_gamer(gamer)
    puts("#{gamer.name} (#{gamer.bank}):")
    if @game.status == :run && gamer.class == Dealer
      gamer.cards.each { print "* " }
      puts
    else
      gamer.cards.each { |card| print "#{card.inspect}  " }
      print "(#{gamer.sum})"
      if gamer.sum > 21
        puts ' Перебор!' 
      else
        puts
      end
    end
    puts
  end

  def print_actions
    @game.actions.each.with_index(1) do |v, i|
      case v
      when :skip
        puts "#{i}. Пропустить"
      when :add
        puts "#{i}. Добавить"
      when :open
        puts "#{i}. Открыться"
      end
    end
  end

  def continue?
    answer = ''
    loop do
      print "Хотите ещё (д/н)? "
      answer = gets.chomp
      break if answer =~ /^[ynдн]$/ix
    end
    return(answer =~ /^[yд]$/ix)
  end 
end
