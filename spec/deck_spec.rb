require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  let!(:card1) { Card.new(:diamond, 'Queen', 12) }
  let!(:card2) { Card.new(:spade, '3', 3) }
  let!(:card3) { Card.new(:heart, 'Ace', 14) }
  let!(:card4) { Card.new(:club, '5', 5) }

  let!(:cards) { [card1, card2, card3] }
  let!(:deck) { Deck.new(cards) }

  describe "#initialize" do
    it "exists" do
      expect(deck).to be_an_instance_of(Deck)
      expect(deck.cards).to eq(cards)
    end
  end

  describe "#rank_of_card_at" do
    it "returns the rank of a card a specified index" do
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end
  end
end
