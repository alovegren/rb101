# # Problem: Build a 'Twenty-One' game.

# # Rules
# Setup
# - Played with a 52-card deck
#   - 4 suits (hearts, diamonds, clubs, spades) x 13 values
#   - values: 2-10, jack, queen, king, ace
# - The cards each have values
#   - Suits do not impact card value
#   - cards 2-10 carry the expected value (e.g. 2 has a value of 2, 3 of 3...)
#   - Jack, Queen and King are all worth 10
#   - Ace is worth 1 or 11
#     - An ace's value is not constant
#       - The ace's value is 11 if
#         - A player's hand, including an ace, would not exceed 21 if the ace #           were 11
#       - Otherwise, the ace's value is 1
# - There are two players: the player and the dealer
# - Each player gets one turn
# - Before the game commences, both players are dealt two cards
# - The player can see their cards and one of the dealer's
# - The player goes first
# - On each turn, the player continually draws cards to add to their hand
#   - The player wins if, at the end of their turn the sum of their cards is    higher than the dealer's and this sum does not exceed 21
# - During their turn, the player is repeatedly asked if they want to 'hit' or 'stay'
#   - If the player answers 'hit', a card is added to their hand
#   - If the player answers 'stay', their turn is over and the current sum of their hand will be used to determine a winner
#   - If the sum of the player's cards, at any time, exceeds 21, the player 'busts' and automatically loses the entire game
# - The dealer then goes, with access to the same two actions during their turn
#   - The dealer will 'hit' so long as the current total of their cards is less than 17
#   - Like the player, the dealer will automatically lose if they 'bust' at any time
# - If both turns are completed with neither the player nor the dealer busting, the final sums of each hands are compared. Whichever player with the higher sum wins.

# # Examples
# Dealer is dealt a 3 and Jack (Player can see '3' only)
# Player is dealt a 2 and a 3
# - Player hits and gets an Ace (current sum = 16)
# - Player hits and gets an 8 (current sum = 14)
# - Player stays (final sum = 14)
# Dealer's turn
# - Dealer hits and gets an Ace (current sum = 14)
# - Dealer hits and gets an Ace (current sum = 15)
# - Dealer hits and gets a 7 (current sum = 22)
# Because the dealer's sum reached 22, the dealer busts and the player loses

# # Examples
# Dealer is dealt a 3 and Jack (Player can see 'Jack' only)
# Player is dealt an Ace and a 3 (current sum = 14)
# - Player hits and gets a Jack (current sum = 14)
# - Player hits and gets an Ace (current sum = 15)
# - Player stays (final sum = 15)
# Dealer's turn (current sum = 13)
# - Dealer hits and gets a 5 (current sum = 18)
# - Dealer stays (final sum = 18)
# Dealer wins because their final sum is higher than the player's

# # Data Structure
# Deck
# - When we draw a card, we need the suit and value to be accessible at the same time
# - Since we want to easily draw a random card, we want our suits to be on the same level within the data structure
# - We'll elect to use a nested array, in which there are 52 hashes containing key/value pairs describing the card's value and suit
#   - We'll go for a hash just so that the code is more readable. (a two-element array could also work)
# - To initialize this deck, we can iterate through an array of suits and all of the values with which we want to assign our cards
# Cards
# - The player's and dealer's cards will also be nested arrays containing the same (that is, the same object_id) two-element hashes as described above.
# - When a card is drawn, a hash will be destructively removed from the deck array and destructively added to a player or dealer's hand.

# # Algorithm
# Constants:
# - Suits
# - Card values
# - Values of face cards
#   - Hash where keys are face card strings and values are all possible card values
# 1. Initialize deck
# - Create a new array for the deck
# - Iterate through an array containing string objects representing the four suits
#   - Iterate through the range of card values
#     - For each value, add a hash to the deck array containing the current suit and the current value,
#     - As key/value pairs where value and suit are labeled by the keys
# - Return the completed array

# 2. Deal cards to player and dealer
# - Create new arrays for player ahnd and dealer hand
# - Define a generic method to draw a card
#   - Draw card: Destructively remove a hash from the deck array and add them to the current player's hand
#   - Return value not important
# - Deal ('draw') two cards each for the dealer and player
# - Let the player know the contents of their hand, and one of the dealer's cards
#   - We'll have to do this each time the player draws, so write a method for it
#   - Reuse the 'joinor' method from TTT to format the message

# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.