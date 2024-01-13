require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  describe "type :basic" do
    let(:card1) { Card.new(:heart, 'Jack', 11) }
    let(:card2) { Card.new(:heart, '10', 10) }
    let(:card3) { Card.new(:heart, '9', 9) }
    let(:card4) { Card.new(:diamond, 'Jack', 11) }
    let(:card5) { Card.new(:heart, '8', 8) }
    let(:card6) { Card.new(:diamond, 'Queen', 12) }
    let(:card7) { Card.new(:heart, '3', 3) }
    let(:card8) { Card.new(:diamond, '2', 2) }
    let(:deck1) { Deck.new([card1, card2, card5, card8]) }
    let(:deck2) { Deck.new([card3, card4, card6, card7]) }
    let(:player1) { Player.new("Megan", deck1) }
    let(:player2) { Player.new("Aurora", deck2) }
    let(:turn) { Turn.new(player1, player2) }

    it "exists with players, spoils of war and a turn type" do
      expect(turn).to be_a(Turn)
      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
      expect(turn.spoils_of_war).to eq([])
    end

    context "#winner" do
      it "returns the winner of the turn" do
        expect(turn.type).to eq(:basic)
        expect(turn.winner).to eq(player1)
      end
    end

    context "#pile_cards" do
      it "will have each player will send one card (the top card) to the spoils pile" do
        turn.pile_cards

        expect(turn.spoils_of_war).to eq([card1, card3])
      end
    end

    context "#award_spoils" do
      it "adds each of the cards in the spoils_of_war array to the winner of the turn" do
        winner = turn.winner

        turn.pile_cards
        turn.award_spoils(winner)

        expect(player1.deck.cards).to eq([card2, card5, card8, card3, card1])
        expect(player2.deck.cards).to eq([card4, card6, card7])
      end
    end
  end

  describe "type :war" do
    let(:card1) { Card.new(:heart, 'Jack', 11) }
    let(:card2) { Card.new(:heart, '10', 10) }
    let(:card3) { Card.new(:heart, '9', 9) }
    let(:card4) { Card.new(:diamond, 'Jack', 11) }
    let(:card5) { Card.new(:heart, '8', 8) }
    let(:card6) { Card.new(:diamond, 'Queen', 12) }
    let(:card7) { Card.new(:heart, '3', 3) }
    let(:card8) { Card.new(:diamond, '2', 2) }
    let(:deck1) { Deck.new([card1, card2, card5, card8]) }
    let(:deck2) { Deck.new([card4, card3, card6, card7]) }
    let(:player1) { Player.new("Megan", deck1) }
    let(:player2) { Player.new("Aurora", deck2) }
    let(:turn) { Turn.new(player1, player2) }

    it "exists with players, spoils of war and a turn type" do
      expect(turn).to be_a(Turn)
      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
      expect(turn.spoils_of_war).to eq([])
    end

    context "#winner" do
      it "returns the winner of the turn" do
        expect(turn.type).to eq(:war)
        expect(turn.winner).to eq(player2)
      end
    end

    context "#pile_cards" do
      it "will have each player will send one card (the top card) to the spoils pile" do
        turn.pile_cards

        expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
      end
    end

    context "#award_spoils" do
      it "adds each of the cards in the spoils_of_war array to the winner of the turn" do
        winner = turn.winner

        turn.pile_cards
        turn.award_spoils(winner)

        expect(player1.deck.cards).to eq([card8])
        expect(player2.deck.cards).to eq([card7, card6, card3, card4, card5, card2, card1])
      end
    end
  end
end
