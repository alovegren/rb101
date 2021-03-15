# # Problem: Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# Input: String
# Output: String

# # Rules
# Explicit
# - The first and last letters of each word must be swapped.
# - Assume the string will not be empty
# - Assume the string contains only words and spaces
# Implicit
# - Capitalization of characters should be preserved
# - Given a one character string, return the same string

# # Test Cases:

# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# # Data Structure:
# - We can access each character in a string using its index
# - We can break up the words in our string into an array using spaces as a delimiter

# # Algorithm
# - Split string into an array, using space as delimiter
# - Iterate through words in the array
#   - Save first letter
#   - Save last letter
#   - Reassign first letter of element to last letter's value
#   - Do the reverse

def swap(str)
  arr = str.split.each do |word|
    first, last = [word[0], word[-1]] # We can combine this line and the next
    word[0] = last # The expression to the right of '=' doesn't need to be an array
    word[-1] = first
  end
  arr.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# # Further Exploration:

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

# Will the following set of methods work like the preceding ones?

def swap_first_last_characters(a, b)
  a, b = b, a
end

word = "Emmers"

p swap_first_last_characters(word[0], word[-1])
puts word

# This doesn't work the same way as the first set of methods. We need to think about what exactly is being passed to the method to understand why.

# In the first example, the entire word is passed to the method that swaps the first and last characters. Then the word is mutated by using indexed reassignment.

# However, only the first and last characters are passed to the second swapping method. When passing word[0] and word[-1], we are creating new string objects, containing single characters and simply reassigning them within our method. In other words, this method accepts two arguments: the value at word[0] and the value at word[1]. When they are passed as arguments, they are simply considered as characters divorced from their indices within the original word.
