# # Problem: Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

# Input: String
# Output: Boolean

# # Rules
# Explicit requirements: 
# - The program should define a method with one parameter
# - If the string passed in is a palindrome
#   - That is, if it reads the same forwards as backwards
#   - Return true
# - Otherwise, return false
# - Ignore case and alphanumeric characters
# - The method we wrote in the last exercise may be used

# # Examples/Test Cases

# real_palindrome?('madam') == true
# real_palindrome?('Madam') == true           # (case does not matter)
# real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# real_palindrome?('356653') == true
# real_palindrome?('356a653') == true
# real_palindrome?('123ab321') == false

# # Data Structure
# If a word or sentence is a palindrome:
# - the first character should be the same as the last character
# - the second character should be the same as the second-to-last character
# - the third character should be the same as the third-to-last character...
# - and so on
# Put another way, if we were to run the values of a string through a program by counting UP, the values would be passed in the same order as if we were counting DOWN. So in our program, we can count down and up through a string at the same time, and if each value compared between the two counting methods is the same, we have a palindrome.

# Forwards index (i):     0  1  2  3  4  5
#                         e  m  m  e  r  s
# Backwards index (b):   -6 -5 -4 -3 -2 -1

#   b = (i + 1)*(-1)

# In this problem, we also need to find a way to exclude non-alphanumeric characters and case in our criteria for determining a palindrome.

# # Algorithm
# - Define a method which accepts one parameter
# - Groom the passed argument:
#   - Downcase the argument
#   - Remove all non-alphanumeric characters
#     - Convert the string to an array
#     - Use selection to create a new array, selecting only characters which fall into the range of lowercase letters
#     - Convert the resulting array back into a string
# - Call our palindrome? method on the resulting groomed string

def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(messy_string)
  groomed_string = messy_string.downcase.chars.select do |char|
    [*'0'..'9', *'a'..'z'].include?(char)
  end
  groomed_string = groomed_string.join
  palindrome?(groomed_string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false