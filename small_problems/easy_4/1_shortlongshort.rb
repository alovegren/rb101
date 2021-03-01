# # Problem: Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

# Input: Two strings
# Output: one string

# # Rules
# Explicit Requirements
# - The program should use a method defined with two parameters
# - The program should return a concatenation of the two strings given:
#   - Where 'short' is the length of the shorter string given and 'long' the longer,
#   - Returned string: shortlongshort
# - We can ignore the edge case in which both strings are the same length
# Implicit Requirements
# - If an empty string is given, the other given string will be the output
# - The strings should be concatenated with no spaces separating them

# # Examples/Test Cases:

# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

# # Data Structure/Algorithm
# To solve this problem, we need to first check which string is shorter, and then instruct the program to concatenate two copies of it, with the longer string sandwiched in between.

# We have the idea to use an array structure to prepare our strings for concatenation. Then, the commands to concatenate and print can be reused for either case: that the first string is shorter, or that the second is.

# Algorithm
#  - Define a method with two parameters
  # - Initialize an array containing the two arguments
  # - Iterate through arguments
  #   - If the first string is shorter
  #       - Bind the first string to a 'short' variable
  #       - and the second to a 'long' variable
  #   - Otherwise, 
  #       - bind the strings to variables in reverse
  #       - Reverse the order of the array
  # - Add an element to the array referencing the value of the 'short' variable
  # - Join the elements of the array together

def short_long_short(string1, string2)
  ordered_array = [string1, string2]
  if string1.size < string2.size
    short = string1
    long = string2
  else
    short = string2
    long = string1
    ordered_array.reverse!
  end
  ordered_array << short
  ordered_array.join
end

# Glancing at the user submitted solutions we see we can completely do away with the array...

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# Or....

def short_long_short2(string1, string2)
  ordered_array = [string1, string2].sort_by { |string| string.size }
  ordered_array << ordered_array[0]
  ordered_array.join
end

p short_long_short2('abc', 'defgh') == "abcdefghabc"
p short_long_short2('abcde', 'fgh') == "fghabcdefgh"
p short_long_short2('', 'xyz') == "xyz"