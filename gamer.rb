class Gamer
  attr_accessor :bank
  attr_reader :cards
  attr_reader :sum
  attr_reader :name

  def initialize(bank, name)
    @bank = bank
    @name = name
  end

  def init(deck)
    @cards = []
    @deck = deck
    2.times { take_card }
    compute_sum
  end

  def take_card
    @cards << @deck.take
  end

  def compute_sum
    sum = 0

    # Сумма по картам без тузов
    @cards.select { |card| card.value != 'Т' }.each do |card|
      value = card.value.to_i
      sum += value
      sum += 10 if value == 0
    end
    best_sum = sum

    # Перебор комбинаций очков с тузами
    n = @cards.select { |card| card.value == 'Т' }.count

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
