# # Problem: Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

# Input: A string
# Output: Boolean

# # Rules
# Explicit Requirements:
# - The program should define a method with one parameter
# - If a string passed in is a palindrome-- that is, it reads forward the same as it does backwards-- the program should return true
# - Otherwise, return false
# - Case matters
# - Punctuation matters
# - Spaces matter

# # Examples/Test Cases:

# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true


# # Data Structure
# If a word or sentence is a palindrome:
# - the first character should be the same as the last character
# - the second character should be the same as the second-to-last character
# - the third character should be the same as the third-to-last character...
# - and so on
# Put another way, if we were to run the values of a string through a program by counting UP, the values would be passed in the same order as if we were counting DOWN. So in our program, we can count down and up through a string at the same time, and if each value compared between the two counting methods is the same, we have a palindrome.

# The way elements in a collection are referred to forwards and backwards does present us with a bit of a problem, however:

# Forwards index:     0  1  2  3  4  5
#                     e  m  m  e  r  s
# Backwards index:   -6 -5 -4 -3 -2 -1

# Reviewing the relationship for a little while, however, we can simply say:
# - Where i is the forwards index and b is the backwards index:
#   - b = (i + 1)*(-1)

# # Algorithm (manual)
# - Define a method with one parameter
# - Define an empty array for boolean values
# - Determine whether the given argument is a palindrome
#   - Iterate through a range equal to the size of the string argument
#   - Use the index of the iteration 'i' as the 'forwards index'
#   - Define 'b', the 'backwards index' as b = (i + 1)*(-1)
#   - if the character at i is the same as the character at b, add a true value to the array
#   - otherwise, add a false value
#   - Return false if the array includes any false values
#   - Otherwise, return true

def palindrome?(str)
  tests = []
  for i in 0...str.size
    b = (i + 1) * (-1)
    str[i] == str[b] ? (tests << true ) : (tests << false)
  end
  !tests.include?(false)
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?([[3, 5, 6, 6, 3]]) == true

# # Algorithm (idiomatic)
# Define a method with one parameter
# - Check if the given string is equal to itself with the reverse method called on it

def palindrome?(str)
  str == str.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?([[3, 5, 6, 6, 3]]) == true