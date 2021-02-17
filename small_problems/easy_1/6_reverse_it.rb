# Problem: Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# Input: A string consisting of only letters and spaces
# Output: The same, modified string

# Explicit requirements:
#   - The words which have five or more characters should be reversed
#   - Words which have fewer characters should be left alone
#   - The same string should be returned
#   - Spaces should be included in the input string only when more than one word is present

# Examples:

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# Data Structures: String input and output. At some point the substring words may need to be placed in an array

# Algorithm
# - Define a method that takes one string argument
# - Create an array of the substrings in the string delimited by spaces
# - Iterate through the array
#   -Reverse the substring if it is five or more characters
# - Join the substrings back together separated by whitespace characters
# - Return the joined string

def reverse_words(string)
  substrings = string.split
  
  substrings.each { |substring| substring.reverse! if substring.length >= 5 }
  
  substrings.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS