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
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    end
  end

  def winner
    case
    when type == :basic
      players.max_by { |player| player.deck.rank_of_card_at(0) }
    end
  end

  def pile_cards
    case
    when type == :basic
      players.each { |player| spoils_of_war << player.deck.cards.shift }
    end

  end

  def award_spoils(winner)
    case
    when type == :basic
      while !spoils_of_war.empty?
        winner.deck.cards << spoils_of_war.pop
      end
    end
  end
end