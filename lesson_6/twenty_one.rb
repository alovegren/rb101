require "pry"

# # # # # # # # # # # CONSTANTS # # # # # # # # # # #

SUITS = ['spades', 'clubs', 'diamonds', 'hearts']
FACE_VALUES = { 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 1 }
ALL_VALUES = [*2..10, *FACE_VALUES.keys]

# # # # # # # # # # # # METHODS # # # # # # # # # # # #

def prompt(msg)
  puts "===> #{msg}"
end

def emphasized_prompt(msg)
  puts "
  =====> #{msg} <=====
  "
end

def joinand(arr, punct=', ', word='and')
  return arr[0].to_s if arr.size == 1
  return arr.join(' and ') if arr.size == 2

  i = 1
  punctuated_arr = [arr[0]]
  loop do
    if i == (arr.size - 1)
      punctuated_arr << " #{word} " << arr[i]
      break
    end
    punctuated_arr << punct << arr[i]
    i += 1
  end
  punctuated_arr.join
end

def value_of_suit_format(card)
  "#{card['value']} of #{card['suit']}"
end

def draw_card(source, hand)
  hand << source.delete(source.sample)
end

def display_full_hand(hand)
  formatted_cards = hand.map do |card|
    value_of_suit_format(card)
  end
  joinand(formatted_cards)
end

def display_partial_hand(hand)
  value_of_suit_format(hand[0])
end

# # # Initialize deck # #
deck = []

SUITS.each do |suit|
  ALL_VALUES.each do |value|
    deck << { 'suit' => suit,
              'value' => value }
  end
end

# # Adjust value of aces to calculate sum of hand # #
def collect_all_possible_values(hand)
  hand.map do |card|
    if (2..10).include?(card['value'])
      card['value']
    else
      FACE_VALUES[card['value']]
    end
  end
end

# rubocop: disable Lint/UselessAssignment
def adjust_hand(hand)
  all_possible_values = collect_all_possible_values(hand)

  all_possible_values.each do |value|
    next if value != 1
    value = 11 if all_possible_values.sum < 11
  end
end
# rubocop: enable Lint/UselessAssignment

# # Check if adjusted hand sum is greater than 21 # #
def bust?(hand)
  adjust_hand(hand).sum > 21
end


# # Declare winner (given neither player busted) # #
def determine_winner(plyr_total, dlr_total)
  case plyr_total <=> dlr_total
  when -1 then 'Dealer'
  when 0 then 'Tie'
  when 1 then 'Player'
  end
end

def declare_winner(plyr_total, dlr_total)
  winner = determine_winner(plyr_total, dlr_total)
  prompt "#{winner} wins!" if winner != 'Tie'
  prompt "It's a tie!" if winner == 'Tie'
end

def display_rules
  emphasized_prompt "Rules:"
  prompt "You and the dealer are each dealt two cards at the start of the game."
  prompt "You can see all of your cards, but only one of the dealer's."
  prompt "On your turn, you may draw as many cards as you wish."
  prompt "You want the sum of your hand to be as close as possible to 21..."
  prompt "WITHOUT exceeding it. If you do, you lose, or 'bust'!"
  prompt "All cards are worth their standard values (Face cards = 10)..."
  prompt "Except for the Ace. That is worth 11 points, unless:"
  prompt "That value would cause you to go over 21."
  prompt "Example: A + K = 21"
  prompt "Example: A + K + A = 12"
  prompt "Example: A + 6 = 17"
  prompt "If neither player busts, the player with the highest score wins!"
end

# # # # # # # # # # # GAME LOOP # # # # # # # # # # #

# # Setup # #
emphasized_prompt "Welcome to Twenty-One!"
prompt "Do you know the rules? (y or n)"
knows_rules = ''

loop do
  knows_rules = gets.chomp.downcase
  break if knows_rules == 'y' || knows_rules == 'n'
  prompt "Sorry, what was that? Please answer 'y' or 'n'."
end

display_rules if knows_rules == 'n'

emphasized_prompt "Let's get started!"

loop do
  dealer_hand = []
  player_hand = []

  2.times { |_| draw_card(deck, dealer_hand) }
  2.times { |_| draw_card(deck, player_hand) }

  player_total = adjust_hand(player_hand).sum

  prompt "You have: #{display_full_hand(player_hand)}, for a total of #{player_total}."
  # rubocop:disable Layout/LineLength
  prompt "The dealer has: #{display_partial_hand(dealer_hand)} and an unknown card."
  # rubocop: enable Layout/LineLength

  # # Player's turn # #
  prompt "Player's turn!"

  loop do
    player_move = ''

    loop do
      prompt "Do you want to 'hit' or 'stay'?"
      player_move = gets.chomp.downcase
      break if player_move == 'hit' || player_move == 'stay'
      prompt "Sorry, that isn't a valid choice. Please type 'hit' or 'stay'."
    end

    break if bust?(player_hand) || player_move == 'stay'

    prompt "You hit!"
    draw_card(deck, player_hand)

    player_total = adjust_hand(player_hand).sum
    prompt "You have: #{display_full_hand(player_hand)}, for a grand total of #{player_total}."

    break if bust?(player_hand) || player_move == 'stay'
  end

  # # Check for player bust, then dealer's turn # #
  if bust?(player_hand)
    prompt "You busted! Dealer wins."
  else
    prompt "You stayed at #{player_total}."
    prompt "Dealer's turn!"

    dealer_total = adjust_hand(dealer_hand).sum
    prompt "The dealer's total is now #{dealer_total}."

    until adjust_hand(dealer_hand).sum >= 17
      prompt "The dealer hits!"
      draw_card(deck, dealer_hand)
      dealer_total = adjust_hand(dealer_hand).sum
      prompt "The dealer's total is now #{dealer_total}."
    end

    # # Check for dealer bust, then compare final hands # #
    if bust?(dealer_hand)
      prompt "Dealer busted! You win."
    else
      player_total = adjust_hand(player_hand).sum
      dealer_total = adjust_hand(dealer_hand).sum
      
      prompt "The dealer stayed."
      prompt "You have: #{display_full_hand(player_hand)} for a grand total of #{player_total}."
      prompt "The dealer has: #{display_full_hand(dealer_hand)} for a grand total of #{dealer_total}."

      declare_winner(player_total, dealer_total)
    end
  end

  prompt "Do you want to play again? y or n"
  play_again = gets.chomp.downcase
  break unless play_again == 'y'

  system 'clear'
  emphasized_prompt "New Game"
end

# # Goodbye message # #
emphasized_prompt "Thanks for playing Twenty-One!"

# Rubocop: Useless Assignment
# Display player's sum after each draw
