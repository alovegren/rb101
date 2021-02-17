# Problem: Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# Input: A positive integer
# Output: A positive integer, which is the sum of the input's digits

# Examples/Test Cases

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# Data Structure
# - Digits of the input integer separated into a one-dimensional array

# Algorithm
# - Define a method with one parameter
# - Convert the Integer parameter into a string
# - Separate that string into characters and send these to a new array
# - Convert characters back into integers
# - Sum the integers in the array

def sum(int)
  characters = int.to_s.split('')
  characters.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
