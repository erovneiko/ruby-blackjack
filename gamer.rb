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
    @sum = @cards.sum { |card| card.score }
    @cards.select { |card| card.value == 'Т' } \
      .count.times { @sum -= 10 if @sum > 21 }
  end
end
