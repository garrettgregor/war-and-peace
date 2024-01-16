require "./lib/card_generator"

RSpec.describe CardGenerator do
  filename = "./fixtures/cards.txt"

  describe "#cards" do
    it "returns a new deck" do
      cards = CardGenerator.new(filename).cards

      expect(cards).to be_an(Array)

      cards.each do |card|
        expect(card).to be_a(Card)
        expect(card.value).to be_a(String)
        expect(card.suit).to be_a(Symbol)
        expect(card.rank).to be_a(Integer)
      end

      club2 = cards[0]

      expect(club2.value).to eq("2")
      expect(club2.suit).to eq(:club)
      expect(club2.rank).to eq(2)
    end
  end
end
