require_relative 'terminal'
require_relative 'game'
require_relative 'dealer'
require_relative 'user'

class BlackJack
  def initialize
    Terminal.new(
      Game.new(
        Dealer.new(100), 
        User.new(100, Terminal.get_name)
      )
    ).start_game
  end
end
