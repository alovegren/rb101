=begin

In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

lowercase constant: match from a to z
uppercase constant: match from A to Z
neither constant: no match in either a to z or A to Z

Main method
- Create a hash with lower, upper and neither entries
- Calculate the percentage worth of each letter in the string (divide one by number of chars in string, multiply by 100)
- Add the return of counting the characters that match the lowercase constant, times the percentage worth, to the lowercase hash value
  - round to one decimal point if needed
- Repeat for uppercase
- Repeat for neither
- Return the hash

=end

LOWERCASE = '/a-z/'
UPPERCASE = '/A-Z/'
NEITHER = '^/a-zA-Z/'

def letter_percentages(str)
  percentages_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  percent_per_char = (1.0 / str.size ) * 100

  percentages_hash[:lowercase] = (str.count(LOWERCASE) * percent_per_char).round(1)
  percentages_hash[:uppercase] = (str.count(UPPERCASE) * percent_per_char).round(1)
  percentages_hash[:neither] = (str.count(NEITHER) * percent_per_char).round(1)

  percentages_hash

end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }