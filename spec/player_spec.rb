require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  let!(:card1) { Card.new(:diamond, 'Queen', 12) }
  let!(:card2) { Card.new(:spade, '3', 3) }
  let!(:card3) { Card.new(:heart, 'Ace', 14) }
  let!(:deck) { Deck.new([card1, card2, card3]) }
  let!(:player) { Player.new('Clarisa', deck) }

  describe "initialize" do
    it "exists with a name and a deck" do
      expect(player).to be_a(Player)
      expect(player.name).to eq("Clarisa")
      expect(player.deck).to eq(deck)
    end
  end
end


# pry(main)> player.has_lost?
# #=> false

# pry(main)> player.deck.remove_card
# #=> #<Card:0x007f9cc3a73a98 @rank=12, @suit=:diamond, @value="Queen">

# pry(main)> player.has_lost?
# #=> false

# pry(main)> player.deck.remove_card
# #=> #<Card:0x007f9cc3a03720 @rank=3, @suit=:spade, @value="3">

# pry(main)> player.has_lost?
# #=> false

# pry(main)> player.deck.remove_card
# #=> #<Card:0x007f9cc3a44c98 @rank=14, @suit=:heart, @value="Ace">

# pry(main)> player.has_lost?
# #=> true

# pry(main)> player.deck
# #=> #<Deck:0x007f9cc396bdf8 @cards=[]>
