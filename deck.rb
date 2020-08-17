require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
    @deck = []
    Card::VALUES.each_key do |value|
      Card::SUITS.each_key do |suit|
        @deck << Card.new(value, suit)
      end
    end
  end

  def take
    @deck.delete(@deck.sample)
  end

  def inspect
    inspect = ''
    @deck.each.with_index(1) do |card, i|
      inspect += card.inspect + '  '
      inspect += ' ' if card.value != '10'
      inspect += "\n" if i % 4 == 0
    end
    inspect
  end
end
