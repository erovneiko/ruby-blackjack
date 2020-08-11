require_relative 'gamer'

class User < Gamer
  def print_status(mode)
    puts("#{@name} (#{@bank}):")
    @cards.each { |v| print "#{v}  " }
    print "(#{@sum})"
    if @sum > 21
      puts ' Перебор!' 
    else
      puts
    end
    puts
  end

  def make_turn(deck)
    func = []
    func << :skip
    func << :add if @cards.size == 2
    func << :open

    func.each.with_index(1) do |v, i|
      case v
      when :skip
        puts "#{i}. Пропустить"
      when :add
        puts "#{i}. Добавить"
      when :open
        puts "#{i}. Открыться"
      end
    end

    answer = 0
    loop do
      print '> '
      answer = gets.chomp.to_i
      break if (1..func.size).include?(answer)
    end

    if func[answer - 1] == :add
      take_card(deck) 
      compute_sum
    end

    return(func[answer - 1])
  end
end
