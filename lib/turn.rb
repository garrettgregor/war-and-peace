class Turn
  attr_reader :player1, :player2, :spoils_of_war, :players

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @players = [player1, player2]
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    case type
    when :mutually_assured_destruction
      "No Winner"
    when :war
      players.max_by { |player| player.deck.rank_of_card_at(2) }
    when :basic
      players.max_by { |player| player.deck.rank_of_card_at(0) }
    end
  end

  def pile_cards
    case type
    when :mutually_assured_destruction
      players.each { |player| 3.times { player.deck.remove_card } }
    when :war
      players.each { |player| 3.times { spoils_of_war << player.deck.remove_card } }
    when :basic
      players.each { |player| spoils_of_war << player.deck.remove_card }
    end
  end

  def award_spoils(winner)
    while !spoils_of_war.empty?
      winner.deck.cards << spoils_of_war.shuffle!.pop
    end
  end
end
