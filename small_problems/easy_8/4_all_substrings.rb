=begin

Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:

Problem
- Given a string, return all of the substrings in the string, in the following order:
  - Arranged first by where in the string the substring begins, and then by length

Algorithm
- Use helper method from previous exercise
- Iterate from 0 to the length of the given string, non-inclusive
  - Pass the substring from the current value of the iteration to the last index in the string to the helper method
  - Add the result to an array
- Flatten the array and return it
=end

def leading_substrings(str)
  (1..str.size).map { |length| str[0, length] }
end

def substrings(str)
  (0...str.size).map { |start_idx| leading_substrings(str[start_idx..-1])}.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]