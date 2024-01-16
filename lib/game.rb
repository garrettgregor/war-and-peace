class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    puts"
     _________      _________
    |         |    |         |
    |   10    |    |   Q     |
    |    ♥    |    |    ♠    |
    |         |    |         |
    |_________|    |_________|
         /\\             /\\
        /  \\           /  \\
       #{player1.name}    vs    #{player2.name}
        \\  /           \\  /
         \\/             \\\/"

    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts " Enter 'p' to play. Enter 'q' to quit. \n"

    start_response = gets.downcase.chomp
    if start_response == "p"
      play
    elsif start_response == "q"
      puts "\n Thanks for playing \n"
    else
      start
    end
  end

  def play
    turn_count = 0

    while !player1.has_lost? || !player2.has_lost? || turn_count == 1_000_000
      turn_count += 1
      turn = Turn.new(player1, player2)
      winner = turn.winner

      if turn.type == :mutually_assured_destruction
        turn.pile_cards
        puts "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
      elsif turn.type == :war
        turn.pile_cards
        turn.award_spoils(winner)
        puts "Turn #{turn_count}: WAR - #{winner.name} won 6 cards"
      elsif turn.type == :basic
        turn.pile_cards
        turn.award_spoils(winner)
        puts "Turn #{turn_count}: #{winner.name} won 2 cards"
      end

      if turn.player1.has_lost?
        return puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      elsif turn.player2.has_lost?
        return puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
      elsif turn_count == 1_000_000
        return puts "---- DRAW ----"
      end
    end
  end
end
