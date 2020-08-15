class Card
  attr_reader :value

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def inspect
    case @suit
    when :spades
      return(@value + '♠')
    when :clubs 
      return(@value + '♣')
    when :diamond
      return(@value + '♦')
    when :heart
      return(@value + '♥')
    end
  end
end
