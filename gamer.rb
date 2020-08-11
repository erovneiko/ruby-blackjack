class Gamer
  attr_accessor :bank
  attr_reader :cards
  attr_reader :sum
  attr_reader :name

  def initialize(bank, name)
    @bank = bank
    @name = name
  end

  def init_round(deck)
    @cards = []
    2.times { take_card(deck) }
    compute_sum
  end

  def take_card(deck)
    @cards << deck.delete(deck.sample)
  end

  def compute_sum
    sum = 0

    # Сумма по картам без тузов
    @cards.select { |card| card.slice(0) != 'Т' }.each do |card|
      c = card.slice(0)
      if c =~ /[2-9]/
        sum += c.to_i
      else
        sum += 10
      end
    end
    best_sum = sum

    # Количество тузов
    n = @cards.select { |card| card.slice(0) == 'Т' }.count

    # Перебор комбинаций очков с тузами
    (2**n).times do |i|
      new_sum = sum
      n.times do |j|
        if i[j] == 1
          new_sum += 11
        else
          new_sum += 1
        end
      end
      best_sum = new_sum if new_sum <= 21 && new_sum > best_sum
    end

    @sum = best_sum
  end
end
