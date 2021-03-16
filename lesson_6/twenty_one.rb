require "pry"

SUITS = ['spades', 'clubs', 'diamonds', 'hearts']
FACE_VALUES = { 'jack'=> 10, 'queen'=> 10, 'king'=> 10, 'ace'=> [1, 11] }
ALL_VALUES = [*2..10, *FACE_VALUES.keys]

# # # # # # # # # # # # METHODS # # # # # # # # # # # # 
def prompt(msg)
  puts "=====> #{msg}"
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
  "#{card["value"]} of #{card["suit"]}"
end

def draw_card(source, hand)
  hand << source.delete(source.sample)
end

def display_your_hand_message(hand)
  formatted_cards = hand.map do |card|
                      value_of_suit_format(card)
                    end
  prompt "You have: #{joinand(formatted_cards)}"
end

def display_dealer_hand_message(hand)
  prompt "The dealer has: #{value_of_suit_format(hand[0])} and an unknown card"
end

# # # Initialize deck
deck = []

SUITS.each do |suit|
  ALL_VALUES.each do |value|
    deck << { 'suit'  => suit,
              'value' => value }
  end
end

# # # Bust

def bust?(hand)
  true
end

def adjust_aces(hand)
  all_values = hand.map do |card|
                 if (2..10).include?(card["value"])
                   card["value"]
                 else
                   FACE_VALUES[card["value"]]
                 end
               end

  ace_count = all_values.count([1, 11])
  all_values.delete([1, 11])

  ace_count.times do |_|
    if all_values.sum < 11
      all_values << 11
    else
      all_values << 1
    end
  end
  all_values
end # => An array of integers
# # # Deal cards to player and dealer

dealer_hand = []
player_hand = []

2.times { |i| draw_card(deck, dealer_hand)}
2.times { |i| draw_card(deck, player_hand)}

display_your_hand_message(player_hand)
display_dealer_hand_message(dealer_hand)

loop do
  player_move = ''

  loop do
    prompt "Do you want to 'hit' or 'stay'?"
    player_move = gets.chomp.downcase
    break if player_move == 'hit' || player_move == 'stay'
    prompt "Sorry, that isn't a valid choice. Please type 'hit' or 'stay'."
  end

  break if bust?(player_hand) || player_move == 'stay'
end

p adjust_aces(player_hand).sum