# # Problem: Write a method that takes a string as input, and returns the ASCII value of the string.

# Input: String
# Output: Integer

# # Rules
# Explicit: 
# - The program must define a method
# - The program must return the ascii value of the string
#   - The ascii value is the sum of the ascii value of each character
# Implicit
# - An empty string should return 0

# # Test Cases

# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0

# # Algorithm
# Break up the string into an array of characters
# Iterate through the array 
# - Add the ascii value of the current character to a held value
# Return the final sum

def ascii_value(str)
  str.chars.inject(0) { |total, char| total + char.ord }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0