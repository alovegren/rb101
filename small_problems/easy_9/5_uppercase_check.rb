=begin

Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

Problem
- Given a string, return true if all alphabetic characters are uppercase
- Otherwise, return false
  - Ignore any non-alphabetic characters when determining true/false
- e.g.
  - 'parroT' -> false
  - 'PARROT' -> true
  - 'P@RR0T' -> true

Data Structure
- Array of single character strings

Algorithm
- Iterate through array of characters in the string
  - Return true if for every iteration, the character is either not contained in the alphabet or is uppercase
  - Otherwise, return false

=end

def uppercase?(str)
  str.chars.all? { |char| !("a".."z").include?(char.downcase) || char.upcase == char }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
