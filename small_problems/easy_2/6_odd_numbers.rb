# Problem: Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# Input: None?
# Output: Multiple strings

# Explicit requirements
# - All odd numbers between 1 and 99 inclusive should be printed to the screen
# - Each odd number should be on its own line

# Algorithm
# - Use a range object and iterate through it
# - Print each element in the range
#   - If the element is odd

# Let's code!

(1..99).each do |num|
  puts num if num.odd?
end

# Further Exploration

# Algorithm
# - Use a range object and iterate through it
# - Send all of the odd numbers to an array
# - Print the array to the screen

puts (1..99).select(&:odd?)