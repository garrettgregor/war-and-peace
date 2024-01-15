require './lib/card'
require './lib/deck'
require './lib/game'
require './lib/player'
require './lib/turn'

clubs_2 = Card.new(:clubs, '2', 2)
clubs_3 = Card.new(:clubs, '3', 3)
clubs_4 = Card.new(:clubs, '4', 4)
clubs_5 = Card.new(:clubs, '5', 5)
clubs_6 = Card.new(:clubs, '6', 6)
clubs_7 = Card.new(:clubs, '7', 7)
clubs_8 = Card.new(:clubs, '8', 8)
clubs_9 = Card.new(:clubs, '9', 9)
clubs_10 = Card.new(:clubs, '10', 10)
clubs_jack = Card.new(:clubs, 'Jack', 11)
clubs_queen = Card.new(:clubs, 'Queen', 12)
clubs_king = Card.new(:clubs, 'King', 13)
clubs_ace = Card.new(:clubs, 'Ace', 14)

diamonds_2 = Card.new(:diamonds, '2', 2)
diamonds_3 = Card.new(:diamonds, '3', 3)
diamonds_4 = Card.new(:diamonds, '4', 4)
diamonds_5 = Card.new(:diamonds, '5', 5)
diamonds_6 = Card.new(:diamonds, '6', 6)
diamonds_7 = Card.new(:diamonds, '7', 7)
diamonds_8 = Card.new(:diamonds, '8', 8)
diamonds_9 = Card.new(:diamonds, '9', 9)
diamonds_10 = Card.new(:diamonds, '10', 10)
diamonds_jack = Card.new(:diamonds, 'Jack', 11)
diamonds_queen = Card.new(:diamonds, 'Queen', 12)
diamonds_king = Card.new(:diamonds, 'King', 13)
diamonds_ace = Card.new(:diamonds, 'Ace', 14)

hearts_2 = Card.new(:hearts, '2', 2)
hearts_3 = Card.new(:hearts, '3', 3)
hearts_4 = Card.new(:hearts, '4', 4)
hearts_5 = Card.new(:hearts, '5', 5)
hearts_6 = Card.new(:hearts, '6', 6)
hearts_7 = Card.new(:hearts, '7', 7)
hearts_8 = Card.new(:hearts, '8', 8)
hearts_9 = Card.new(:hearts, '9', 9)
hearts_10 = Card.new(:hearts, '10', 10)
hearts_jack = Card.new(:hearts, 'Jack', 11)
hearts_queen = Card.new(:hearts, 'Queen', 12)
hearts_king = Card.new(:hearts, 'King', 13)
hearts_ace = Card.new(:hearts, 'Ace', 14)

spades_2 = Card.new(:spades, '2', 2)
spades_3 = Card.new(:spades, '3', 3)
spades_4 = Card.new(:spades, '4', 4)
spades_5 = Card.new(:spades, '5', 5)
spades_6 = Card.new(:spades, '6', 6)
spades_7 = Card.new(:spades, '7', 7)
spades_8 = Card.new(:spades, '8', 8)
spades_9 = Card.new(:spades, '9', 9)
spades_10 = Card.new(:spades, '10', 10)
spades_jack = Card.new(:spades, 'Jack', 11)
spades_queen = Card.new(:spades, 'Queen', 12)
spades_king = Card.new(:spades, 'King', 13)
spades_ace = Card.new(:spades, 'Ace', 14)

cards = [clubs_2, clubs_3, clubs_4, clubs_5, clubs_6, clubs_7, clubs_8, clubs_9, clubs_10, clubs_jack, clubs_queen, clubs_king, clubs_ace, diamonds_2, diamonds_3, diamonds_4, diamonds_5, diamonds_6, diamonds_7, diamonds_8, diamonds_9, diamonds_10, diamonds_jack, diamonds_queen, diamonds_king, diamonds_ace, hearts_2, hearts_3, hearts_4, hearts_5, hearts_6, hearts_7, hearts_8, hearts_9, hearts_10, hearts_jack, hearts_queen, hearts_king, hearts_ace, spades_2, spades_3, spades_4, spades_5, spades_6, spades_7, spades_8, spades_9, spades_10, spades_jack, spades_queen, spades_king, spades_ace]

deck_1 = Deck.new(cards.shuffle)
deck_2 = Deck.new(cards.shuffle)

player_1 = Player.new('Megan', deck_1)
player_2 = Player.new('Aurora', deck_2)

Game.new(player_1, player_2).start
