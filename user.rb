require_relative 'gamer'

class User < Gamer
  def actions
    actions = []
    actions << :skip
    actions << :add if @cards.size == 2
    actions << :open
    actions
  end
end
