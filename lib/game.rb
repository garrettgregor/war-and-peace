class Game
  attr_reader :player1, :player2
  attr_accessor :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
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
       |    |    vs   |    |
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
    while !player1.has_lost? && !player2.has_lost? && @turn_count <= 1_000_000
      @turn_count += 1
      turn = Turn.new(player1, player2)

      if turn.type == :mutually_assured_destruction
        puts "Turn #{@turn_count}: *mutually assured destruction* 6 cards removed from play"
      elsif turn.type == :basic
        turn.pile_cards
        turn.award_spoils(turn.winner)
        puts "Turn #{@turn_count}: #{turn.winner.name} won 2 cards"
      elsif turn.type == :war
        turn.pile_cards
        turn.award_spoils(turn.winner)
        puts "Turn #{@turn_count}: WAR - #{turn.winner.name} won 6 cards"
      end

      if player1.has_lost?
        puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      elsif player2.has_lost?
        puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
      elsif turn_count == 1000000
        puts "---- DRAW ----"
      end
    end
  end
end
