require_relative 'deck'

class Game
  attr_reader :gamer1, :gamer2, :winner
  attr_reader :status, :actions

  def initialize(gamer1, gamer2)
    @gamer1 = gamer1
    @gamer2 = gamer2
    @bet = 10
  end

  def init
    @deck = Deck.new
    @gamer1.init(@deck)
    @gamer2.init(@deck)
    @gamer1.bank -= @bet
    @gamer2.bank -= @bet  
    @status = :run
    @turn = nil
    @next = @gamer2
    @actions = @next.actions
  end

  def turn(action)
    @prev = @turn
    @turn = action

    if action == :add
      @next.take_card
      @next.compute_sum
    end

    if @next == @gamer1
      @next = @gamer2
    else
      @next = @gamer1
    end

    @actions = @next.actions
  end

  def end?
    if @gamer1.cards.size == 3 && @gamer2.cards.size == 3 \
    || @turn == :skip && @prev == :skip \
    || @turn == :add && @prev == :skip \
    || @turn == :skip && @prev == :add \
    || @turn == :open
      @status = :end
      @winner = results
      return(true)
    else
      return(false)
    end
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

    return(winner)
  end
end
