# # Problem: Write a method that will take a short line of text, and print it within a box.

# Input: String
# Output: String (formatted)

# # Rules
# - Solution must be written as a method
# - Method must accept a string argument
# - The box must be custom-fitted to the length of the text given
# - We can assume the length of the text will fit on one line in the terminal window

# # Examples

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# # Data Structure
# - We will be outputting five lines of text:
# 1.  The first line consists of a plus sign,
#   - then a number of dashes calculated based on the input,
#   - then another plus sign
# 2.  The second line consists of a pipe,
#   - then a number of spaces calculated based on the input,
#   - then another pipe
# 3.  The third line consists of a pipe,
#   - then a space, followed by the given string,
#   - then another space
# 4.  The fourth line consists of a pipe,
#   - then a number of spaces calculated based on the input,
#   - then another pipe
# 5.  The fifth line consists of a plus sign,
#   - then a number of dashes calculated based on the input,
#   - then another plus sign

# The number of dashes/spaces is the number of characters in the given string, plus two (the spaces on either side)
# We can print out this many characters given the length of the string
# We'll separate each line out into helped methods so our final method isn't too long, and so that we need not repeat ourselves:
#   - The first and last lines are the same
#   - The second and fourth lines are the same

# # Algorithm
# - Define the first method with an Integer parameter
#   - Print a '+'
#   - Print as many dashes as the argument, plus two
#   - Print a '+'
#   - Go to the next line
# - Define the second method with an Integer parameter
#   - Print a '|'
#   - Print as many spaces as the argument, plus two
#   - Print a '|'
#   - Go to the next line
# - Define the third method with a string parameter
#   - Print a '|', and then a space
#   - Print the string
#   - Print a space, and then a '|'
#   - Go to the next line
# - Define the final method (which will contain the preceding three) with one String parameter
#   - Call the first method, passing in the length of the String
#   - Call the second method, passing in the length of the String
#   - Call the third method, passing in the String
#   - Repeat the second method call
#   - Repeat the first method call

# # Further Exploration
# - Introduce a loop into the part of the final method which prints the actual string
#   - Using a counter, print the first 78 characters of the string
#   - (the entire string will be printed if it is shorter than 78)
#   - Break out of the loop if the counter has exceeded the length of the string
#   - Increment the counter by 78

TERMINAL_SIZE = 80

def box_edge(num)
  spacer_qty = num + 2

  print '+'
  spacer_qty.times { |_| print '-' }
  print '+'

  print "\n"
end

def box_pad(num)
  spacer_qty = num + 2

  print '|'
  spacer_qty.times { |_| print ' ' }
  print '|'

  print "\n"
end

def box_content(str)
  print '| '
  print str
  print ' |'

  print "\n"
end

def print_in_box(str)
  box_edge(str.size)
  box_pad(str.size)

  char_count = str.size + 4
  loop do
    box_content(str[0..char_count])
    break if char_count <= TERMINAL_SIZE
    char_count -= 80
  end

  box_pad(str.size)
  box_edge(str.size)
end

print_in_box('Jack Sprats was a cat,')
print_in_box('whose wife was made of clay.')
print_in_box('He scrounged around, on the town')
print_in_box('every single day.')

print_in_box('Jack Sprats was a cat, whose wife was made of clay. He scrounged around, on the town, every single day.')