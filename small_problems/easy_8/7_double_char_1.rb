=begin

Write a method that takes a string, and returns a new string in which every character is doubled.

Problem
- Given a string, return a new string in which every char is doubled
  - Empty string -> empty string

Algorithm
- Break string into chars and iterate through them
  - Add two of each char to new string
- Return result string

=end

def repeater(str)
  str.chars.map { |char| char * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''