require_relative 'game'
require_relative 'dealer'
require_relative 'user'

def name?
  system('clear')
  puts "Ваше имя?"
  gets.chomp
end

def continue?
  answer = ''
  loop do
    print "Хотите ещё (д/н)? "
    answer = gets.chomp
    break if answer =~ /^[ynдн]$/ix
  end
  return(answer =~ /^[yд]$/ix)
end

game = Game.new(Dealer.new(100), User.new(100, name?))
loop do
  game.init_round
  game.run_round
  break unless continue?
end
