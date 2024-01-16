class Turn
  attr_reader :player1, :player2, :spoils_of_war, :players

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @players = [player1, player2]
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner
    case type
    when :basic
      players.max_by { |player| player.deck.rank_of_card_at(0) }
    when :war
      players.max_by { |player| player.deck.rank_of_card_at(2) }
    when :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    case type
    when :basic
      players.each { |player| spoils_of_war << player.deck.cards.shift }
    when :war
      players.each { |player| spoils_of_war << player.deck.cards.shift(3) }
      spoils_of_war.flatten!
    when :mutually_assured_destruction
      players.each { |player| player.deck.cards.shift(3) }
    end
  end

  def award_spoils(winner)
    winner.deck.cards.concat(spoils_of_war)
    spoils_of_war.clear
    # while !spoils_of_war.empty?
    #   winner.deck.cards << spoils_of_war.pop
    # end
  end
end
