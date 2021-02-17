# Problem

# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

# Examples:

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

# Input: A string
# Output: A new string

# Explicit requirements: 
#   - Take a string and return a new one with the words reversed
#   - This functionality should be written into a method that takes one argument
# Implicit requirements:
#   - The method should return an empty string if one is given
#   - The case of the words should be preserved

# Data Structures: Strings
# - Word substrings will likely need to be split into elements of an array in order to be reversed

# Algorithm
# - Split string into an array containing each of the separate words
# - Sort the words in their reverse order
#   - Create a new empty array
#   - Start a loop
#     - Remove and return the last element of the original array
#     - Add this returned value to the new array
#     - Stop once this has occurred as many times as there were words in the original array
# - Join the words back together with whitespace characters in between
# - Return the joined together string

def reverse_sentence(sentence)
  word_array = sentence.split
  reverse_array = []
  i = word_array.size - 1

  loop do
   break if i < 0
    reverse_array << word_array[i]
    i -= 1
  end

  reverse_array.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# How much time we could have saved if we knew #return! LOL