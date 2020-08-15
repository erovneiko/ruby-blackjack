require_relative 'gamer'

class Dealer < Gamer
  def initialize(bank)
    super(bank, 'Дилер')
  end

  def actions
    if @sum >= 17 
      return([:skip])
    elsif @cards.size == 2
      return([:add])
    end    
  end
end
