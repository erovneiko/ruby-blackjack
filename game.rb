DECK = [
  '2♠', '2♣', '2♦', '2♥', 
  '3♠', '3♣', '3♦', '3♥', 
  '4♠', '4♣', '4♦', '4♥', 
  '5♠', '5♣', '5♦', '5♥', 
  '6♠', '6♣', '6♦', '6♥', 
  '7♠', '7♣', '7♦', '7♥', 
  '8♠', '8♣', '8♦', '8♥',
  '9♠', '9♣', '9♦', '9♥', 
  '10♠','10♣','10♦','10♥', 
  'В♠', 'В♣', 'В♦', 'В♥', 
  'Д♠', 'Д♣', 'Д♦', 'Д♥', 
  'К♠', 'К♣', 'К♦', 'К♥', 
  'Т♠', 'Т♣', 'Т♦', 'Т♥']

class Game
  def initialize(gamer1, gamer2)
    @gamer1 = gamer1
    @gamer2 = gamer2
    @bet = 10
  end

  def init_round
    @deck = Array.new(DECK)
    @gamer1.init_round(@deck)
    @gamer2.init_round(@deck)
    @gamer1.bank -= @bet
    @gamer2.bank -= @bet  
    @next = @gamer2
    @turn = nil
  end

  def run_round
    loop do
      print_status(:play)
      make_turn
      break if end?
    end
  end

  private

  def print_status(mode)
    system('clear')
    @gamer1.print_status(mode)
    @gamer2.print_status(mode)
  end

  def results
    if @gamer1.sum <= 21 && @gamer1.sum > @gamer2.sum \
    || @gamer1.sum <= 21 && @gamer2.sum > 21
      winner = @gamer1
    elsif @gamer2.sum <= 21 && @gamer2.sum > @gamer1.sum \
       || @gamer2.sum <= 21 && @gamer1.sum > 21
      winner = @gamer2
    else
      winner = nil
    end

    if winner
      winner.bank += 2 * @bet
    else
      @gamer1.bank += @bet
      @gamer2.bank += @bet  
    end

    print_status(:final)

    if winner
      puts "Победил #{winner.name}!"
    else
      puts "Ничья!"
    end
  end

  def make_turn
    @prev = @turn
    @turn = @next.make_turn(@deck)
    if @next == @gamer1
      @next = @gamer2
    else
      @next = @gamer1
    end
  end

  def end?
    if @gamer1.cards.size == 3 && @gamer2.cards.size == 3 \
    || @turn == :skip && @prev == :skip \
    || @turn == :add && @prev == :skip \
    || @turn == :skip && @prev == :add \
    || @turn == :open
      results
      return(true)
    else
      return(false)
    end
  end
end
