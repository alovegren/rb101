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
# Define a method to which we'll pass in a winning line and the board
# - Select the elements of the line for which the corresponding value of the board is equal to the player's marker. 
# - If there are two such elements,
#   - Return the third element in the line (that is, the one which corresponds to a blank value in the board hash)
# Create a method to which we'll pass the board. This method will determine the computer's move, taking into consideration all winning lines
# - Initialize a computer move variable equal to nil
# - Iterate through winning lines
#   - Call the method we defined above on the current line, and set the return equal to the computer's move
#   - Break out of the iteration once computer's move has a truthy value (an Integer)
# - Set the computer's move equal to a random one if another Integer was not selected
# - Return the computer's move

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

# # Algorithm (this will be very similar to our defense feature)
# Define a method to which we'll pass in a winning line and the board
# - Select the elements of the line for which the corresponding value of the board is equal to the computer's marker. 
# - If there are two such elements,
#   - Return the third element in the line (that is, the one which corresponds to a blank value in the board hash)
# Add some funtionality to our method that determine's the computer's move
# - If, after iterating through the winning lines array looking for defensive moves, the computer's move is still nil,
#   - Iterate through winning lines
#     - Call the method defined directly above on the current line
#     - Break once the computer's move is truthy (an Integer)
# - Set the computer's move equal to a random one if another Integer was not selected
# - Return the computer's move
# Within the computer places piece method, call the method defined directly above. Set this return value equal to the computer's square.
# Set the value of the board hash at the key 'square' equal to the computer's marker.


# {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "} 

