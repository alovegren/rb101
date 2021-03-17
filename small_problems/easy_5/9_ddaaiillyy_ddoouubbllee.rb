# # Problem: Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

# Input: String
# Output: String

# # Rules
# - The solution should consist of a method defined with one parameter
# - If there are consecutive repetitions of a character,
#   - The method should return a string where that character only appears once
#   - That is, if there are two or more of the same character in a row,
#     - The character should be collapsed into only one
# - Neither String#squeeze nor String#squeeze! may be used

# # Examples:

# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

# # Data Structure
# - We will likely need to separate the string into characters, so we can access Array methods
# - We could iterate through that array, and send each character to a new array,
#   - So long as that character is not the last character in the array

# # Algorithm
# - Separate the string into characters, returning a new array
# - Create a new array
# - Iterate through the first array
#   - Send the current character to the new array, if the last character sent is not the same as the current
# - Join the characters in the new array back together

def crunch(str)
  chars = str.chars
  crunched_chars = []

  chars.each { |char| crunched_chars << char unless crunched_chars.last == char }
  crunched_chars.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''