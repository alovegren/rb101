# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# Questions
#   - Will inputs always be strings?
# input: string
# output: an array of substrings
#   rules:
#     Explicit requirements:
#       - Every sub-string palindrome in the string must be an element in a new 
#         array
#       - Palindrome words are case sensitive (Dad is not a palindrome; dad is)

#      Implicit requirements:
#       - The return value should be a new array
#       - If given an empty string, return an empty array
#       - If no palindromes are found, return an empty array

# Algorithm:
#  - create an empty array called `result` that will contain all required substrings
#  - create a `starding_index` variable (value `0`) for the starting index
#  - start a loop that iterates over `starting_index` from `0` to length of the string minus two
#    - create a `num_chars` variable for the length of a substring
#    - start an inner loop that iterates over `num_chars` from `2` to `string_length - starting_index`
  #    - extract a substring of length `num_chars` from `string` starting at `starting_index`
  #    - append that substring to `result` array
  #    - increment the `num_chars` variable by 1
#    - end of inner loop
#    - increment the `starting_index` variable by 1
#  - end of outer loop
#  - return the result array

# Inside the is_palindrome? method, check whether the value is equal to its reversed value. You can use the String#reverse method.

# START

# /* Given a string named `string` */

# SET result = []
# SET starting_index = 0

# WHILE starting_index <= (string.length - 2)
#   SET num_chars = 2
#   WHILE num_chars <= (string_length - starting_index)
#     SET substring = num_chars characters from string starting at index starting_index
#     append substring to result
#     SET num_chars = num_chars + 1
    
#   SET starting_index = starting_index + 1

# RETURN result

# END

def substrings(string)
  result = []
  starting_index = 0

  while starting_index <= (string.length - 2)
    num_chars = 2
    while num_chars <= (string.length - starting_index)
      substring = string[starting_index, num_chars]
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  return str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substring_arr = substrings(str)
  substring_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

print palindrome_substrings("Emmerswasachimmers")