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

  describe "#high_ranking_cards" do
    it "return an array of cards in the deck that have a rank of 11 or above (face cards and aces)" do
      results = [card1, card3]

      expect(deck.high_ranking_cards).to eq(results)
    end
  end

  describe "#percent_high_ranking" do
    it "return the percentage of cards that are high ranking" do
      result = 66.67

      expect(deck.percent_high_ranking).to eq(result)
    end
  end

  describe "#remove_card" do
    it "remove the top card from the deck" do
      modified_deck = [card2, card3]

      expect(deck.remove_card).to eq(card1)
      expect(deck.cards).to eq(modified_deck)
      expect(deck.high_ranking_cards).to eq([card3])
      expect(deck.percent_high_ranking).to eq(50.0)
    end
  end
end
