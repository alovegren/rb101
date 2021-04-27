=begin

Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

Problem
- Given a string, return the middle character(s)
  - Return 1 char for odd strings
  - e.g.  e  m  m [ m ] e  r  s
  - Return 2 chars for even strings
  - e.g. c  a  [  r  r  ]  o  t
- Assume the string is non-empty

Data Structure
- Strings

Algorithm
- Divide the size of the string in half using integer division, set equal to n
- If the size of the string is even,
  - Return a slice of the string from n-1 to n
- Otherwise,
  - Return the character of the string at index n

=end

def center_of(str)
  half = str.size / 2
  half_minus_one = half - 1

  str.size.even? ? str[half_minus_one..half] : str[half]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'