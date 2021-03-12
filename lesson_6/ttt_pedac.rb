# # # 1. Joinor
# # Problem: Make the opening message read better:
# Instead of '1, 2, 3'
# Prompt '1, 2, or 3'

# Input: Array
# Output: String

# # Rules
# Explicit
# - String should be formatted to read with grammatical correctness
# Implicit
# - Method should take an array and up to two addtional, optional arguments.
#   - The first optional argument specifies what type of punctuation should separate the items in the list. Default: ', '
#   - The second optional argument specifies the word before the last item in the list. Default: 'or'
# - No comma should be used if the input is a two element array
# - Given a one item list, return only the item

# # Test Cases

# joinor([1, 2])                   # => "1 or 2"
# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

# # Algorithm
# - Define a method with three parameters:
#   - an array and two strings.
#   - first string defaults to ', ' and second defaults to 'or'
# - Return a string representation of the element if input is one element array
# - If input is two element array, return items joined by word
# - Otherwise, iterate through elements in the array
#   - When on the last element
#     - Insert word before element in new arr (don't mutate original)
#     - Break out of iteration
#   - Insert punctuation before current element



# # # 3. Computer AI: Defense
# # Problem: The computer currently picks a square at random. That's not very interesting. Let's make the computer defensive minded, so that if there's an immediate threat, then it will defend the 3rd square. We'll consider an "immediate threat" to be 2 squares marked by the opponent in a row. If there's no immediate threat, then it will just pick a random square.

# Rules
# - If the player piece is on two of three spaces on any winning line, the computer should place a piece on the third space in the winning line.
# - Otherwise, the computer can play at random

# # Example
# - Player picks spaces 1 and 3 -> Computer picks space 2
# - Player picks spaces 2 and 5 -> Computer picks space 8

# # Data Structure
# - We will be working with the WINNING_LINES array to determine the criteria for putting the computer on defense
#   - If the current board has Xs on 2/3 elements of any sub-array within WINNING_LINES, the computer is put on defense
#   - The computer should then mark the third element of that WINNING_LINES sub-array

# After a few attempts, We took a peak at the LS solution and are going to approach the problem in a different way.

# # Algorithm
# - First, find at-risk squares within a given winning line that are valid moves
#   - Conditions:
#     - Square must be empty
#     - The other two elements in the line are occupied by player markers, in the board hash.

# Steps
# - Create an empty array for at-risk squares
#   - Count the elements in the line for which the value at the corresponding board hash key is a player marker
#   - If the count equals two and the element corresponds to an empty string,
#     - Add the element to the at-risk squares array

# Because the method above can only work with a single line at a time, we need to call this method for every winning line until an at-risk square is found. 
# - Define another method to find all risk squares on the board, passing in only the board as an argument
#   - Create an array for the risk squares
#   - Initialize a variable at 0 for the current winning line
#   - Create a loop
#     - Break if the array has any value or we've exhausted all winning lines
#     - Add the result of finding the risk squares for the given line
#     - Add 1 to counter
# - If the risk square array is empty, return a random square in empty squares
# - Otherwise, return the first (and only) value of risk_square

# # LS Solution:
# def find_at_risk_square(line, board) # define method and pass in a line from WINNING_LINES and the current board
#   if board.values_at(*line).count('X') == 2 # checks how many times the board values for the elements in line equal 'X'. Evaluate next line if that is two.
#     board.select{|k,v| line.include?(k) && v == ' '}.keys.first # Selects the key value pairs for which the key is present in the line, and the value is empty. Then returns an array of only the keys, then selects the first element in the array.
#   else
#     nil # Returns nil if one or fewer values in the board hash are 'X' at all elements in the line
#   end
# end

# def computer_places_piece!(brd)
#   square = nil # initialize square at nil
#   WINNING_LINES.each do |line| # Iterate through winning lines, assigning the current element in the collection equal to the local variable `line`
#     square = find_at_risk_square(line, brd) # Calls find_at_risk_squares passing in the current line and the board. Recall this returns nil if there are no at risk squares in the current line.
#     break if square # break out of the loop if we found an at risk square in the current line. Otherwise, move on to the next line
#   end

#   if !square # If we ended up finding no at risk squares (square = nil)
#     square = empty_squares(brd).sample # Make the square a random piece
#   end

#   brd[square] = COMPUTER_MARKER # Set hash value of board at square equal to the computer's piece
# end


# # # 4. Computer AI: Offense
# # Problem:  If the computer already has 2 in a row, then fill in the 3rd square, as opposed to moving at random.

# Input: Integer (count of computer's pieces = 2)
# Output: Integer (space computer should place piece on)

# Rules:
# - If, given a solution array,
#   - The board hash value at two of the values in the array are the computer's marker
#     - The computer should mark the board hash key equal to the third element, with their marker

# # Examples
# If the computer has pieces on squares 1 and 2, its next move should be 3.
# If the computer has pieces on squares 1, 2, and 5, its next move should either be 3 or 9

# # Data Structure
# - Like the problem description says, we can parallel the logic in our find_at_risk_squares method to write a method that finds a winning square. When faced with the choice of defending or offending, we'll make the computer defend first since the player always takes the first move.

# # Algorithm



# {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "} 

