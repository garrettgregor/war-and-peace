require "./lib/card"

RSpec.describe Card do
  let!(:card) { Card.new(:heart, 'Jack', 11) }

  describe "instance methods" do
    it "intializes" do
      expect(card).to be_an_instance_of(Card)
      expect(card.suit).to eq(:heart)
      expect(card.value).to eq("Jack")
      expect(card.rank).to eq(11)
    end
  end
end
