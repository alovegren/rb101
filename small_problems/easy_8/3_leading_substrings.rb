=begin

Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

Problem
- Given a string, return an array of all substrings which begin with the character at the first index of the given string
  - Sort substrings from shortest to longest
- Given a single character, return it

Data Structure
- Strings

Algorithm
- Iterate from 1 to the length of the string and on each iteration send a substring of that length, beginning at index 0, to a new array

- Iterate from 1 to length of string
  - Map the current value to a substring of that length, where starting index is index 0 of given string
  - Send each substring to an array
- Return the new array

=end

def leading_substrings(str)
  (1..str.size).map { |length| str[0, length] }
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']