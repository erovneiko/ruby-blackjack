require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
    @deck = []
    ('2'..'10').to_a.concat(['В', 'Д', 'К', 'Т']).each do |value|
      [:spades, :clubs, :diamond, :heart].each do |suit|
        @deck << Card.new(value, suit)
      end
    end
  end

  def take
    return(@deck.delete(@deck.sample))
  end

  def inspect
    inspect = ''
    @deck2.each.with_index(1) do |card, i|
      inspect += card.inspect + '  '
      inspect += ' ' if card.value != '10'
      inspect += "\n" if i % 4 == 0
    end
    return(inspect)
  end
end
