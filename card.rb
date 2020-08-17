
class Card
  attr_reader :value

  VALUES = {
    '2'  => 2,
    '3'  => 3,
    '4'  => 4,
    '5'  => 5,
    '6'  => 6,
    '7'  => 7,
    '8'  => 8,
    '9'  => 9,
    '10' => 10,
    'В'  => 10,
    'Д'  => 10,
    'К'  => 10,
    'Т'  => 11,
  }

  SUITS = {
    spades:  '♠',
    clubs:   '♣',
    diamond: '♦',
    heart:   '♥'
  }

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def score
    VALUES[@value]
  end

  def inspect
    @value + SUITS[@suit]
  end
end
