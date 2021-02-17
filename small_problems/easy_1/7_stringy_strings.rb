# Problem: Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# Input: a positive integer
# Output: a string of alternating 1s and 0s

# Explicit requirements:
# - There should be as many characters in the output string as the Integer argument specifies
# - The 1s and 0s should alternate
# - Each string should start with 1
# - The input will be a positive integer

# Examples

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Data Structure
# Integer input and String output. Looping construct likely needed to count up to the given Integer

# Algorithm
# - Define a method that accepts one argument
# - Initialize a counter
# - Create an empty string
# - Begin a loop
#   - Run the loop until the counter reaches the Integer given
#   - Append 1 to the string if i is even
#   - Append 0 to the string if i is odd

def stringy(num, string_start=1)
  string = ''

  num.times do |i|
    string << '1' if (i + string_start).odd?
    string << '0' if (i + string_start).even?
  end
  
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, 0)
puts stringy(9, 0)
puts stringy(4, 0)
puts stringy(7, 0)
