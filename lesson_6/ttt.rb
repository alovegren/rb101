require 'pry-byebug'
# Tic Tac Toe

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "==> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're an #{PLAYER_MARKER} and computer is a #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def joinor(arr, punct=', ', word='or')
  return arr[0].to_s if arr.size == 1
  return arr.join(' or ') if arr.size == 2

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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice. "
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, brd)
  if line.select { |elem| brd[elem] == PLAYER_MARKER }.count == 2
    line.select { |elem| brd[elem] == ' ' }.first
  end
end

def find_offensive_squares(line, brd)
  if line.select { |elem| brd[elem] == COMPUTER_MARKER }.count == 2
    line.select { |elem| brd[elem] == ' ' }.first
  end
end

def determine_computer_piece(brd)
  computer_move = nil

    WINNING_LINES.each do |line|
      computer_move = find_at_risk_square(line, brd)
      break if !!computer_move
    end

    if !computer_move
      WINNING_LINES.each do |line|
        computer_move = find_offensive_squares(line, brd)
        break if computer_move
      end
    end
  computer_move = empty_squares(brd).sample if !computer_move
  computer_move
end

def computer_places_piece!(brd)
  square = determine_computer_piece(brd)
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def detect_winning_score(comp_score, plyr_score)
  return 'Player' if plyr_score == 5
  return 'Computer' if comp_score == 5
end

# # # # # # # # # Begin method invocations below # # # # # # # # #
computer_score = 0
player_score = 0

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    display_board(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  computer_score += 1 if detect_winner(board) == 'Computer'
  player_score += 1 if detect_winner(board) == 'Player'

  prompt "Player: #{player_score}, Computer: #{computer_score}"

  break if computer_score == 5 || player_score == 5

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "The final winner is #{detect_winning_score(computer_score,
                                                   player_score)}."
prompt "Thanks for playing!"
