require_relative 'gamer'

class Dealer < Gamer
  def initialize(bank)
    super(bank, 'Дилер')
  end

  def print_status(mode)
    puts("#{@name} (#{@bank}):")
    case mode
    when :play
      @cards.each { print "* " }
      puts
    when :final
      @cards.each { |v| print "#{v}  " }
      print "(#{@sum})"
      if @sum > 21
        puts ' Перебор!' 
      else
        puts
      end
    end
    puts
  end

  def make_turn(deck)
    if @sum >= 17 
      return(:skip)
    elsif @cards.size == 2
      take_card(deck)
      compute_sum
      return(:add)
    end 
  end
end
