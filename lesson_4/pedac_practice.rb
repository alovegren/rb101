# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# P - Understand the problem
# Write a method which takes a string, and returns a new array containing all of the substrings within the string which are palindromes.
# Input: A string
# Output: A new array, containg 0 or more string elements

# Explicit requirements
#   - Method must output an array of string elements which are palindromes
#   - Palindromes are case sensitive

# Implicit requirements
#   - If no substrings are arrays, or an empty string is given, return an empty array

# Data structure
# Input is string, output is array of substrings

# Algorithm
# - Define a method `palindrome_substrings` that takes one argument
# - Initialize an empty array variable which will accept palindrome substrings
#     - Call it palindrome_array

# - Produce an array of all of the substrings of the passed in string
#     - Define a method `collect_substrings` and initialize an empty array
#     -Outer loop: iterate through starting indices of string, beginning with 0 and ending with string.length - 2
#       -Inner loop: iterate through values of substring length available at current index, where 2 is the shortest substring we'll return
#       -Append string[starting_index, substring length] to array

# - Out of this array, identify which are palindromes
# - When a palindrome is identified, append palindrome to array
# - Return array of palindrome substrings just before method's end

def collect_substrings(str)
  substrings = []
  index = 0

  while (index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - index)
      substring = str[index, num_chars]
      substrings << substring
      num_chars += 1
    end
    index += 1
  end
  print substrings
end

collect_substrings("dadadadadadadad")

# def palindrome_substring(string)
#   palindrome_array = []

#   i = 0
#   all_substrings = collect_substrings(string)
#   while i <= all_substrings.length
#     substring = all_substrings[i]
#     if is_palindrome?(substring)
#       palindrome_array << substring
#     end
#   end
#   palindrome_array
# end
