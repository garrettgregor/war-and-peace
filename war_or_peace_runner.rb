require './lib/card'
require './lib/deck'
require './lib/game'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

cards = CardGenerator.new(File.open('./fixtures/cards.txt')).cards.shuffle!

deck_1 = Deck.new(cards[0..25])
deck_2 = Deck.new(cards[26..51])

player_1 = Player.new('Megan', deck_1)
player_2 = Player.new('Aurora', deck_2)

Game.new(player_1, player_2).start
