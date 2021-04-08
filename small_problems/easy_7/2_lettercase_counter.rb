require "pry"

=begin

P: Write a method that takes one string as an argument.
Return a hash containing counts of all lowercase letters in string, all uppercase, and all that are non-alphabetical

Input: String
Output: Hash

Rules
- Count spaces
- Hash keys are labels: lower, upper, neither
- Hash values are count
- Given an empty string, return 0s for all hash values

E: 

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

D: String, possibly broken into Arrays for each category. Final return value Hash

A:
- Split given string into characters
- Create new Hash

- Helper method: given an array of characters, find number of lowercase letters
  - Select elements for which the downcased element equals the original element
  - Count those elements
  - Helper method: do the same thing for upcased letters

- Back in main method,
  - Call helper methods (should return Integers)
  - Populate hash with values 
    lowercase key = method call to lowercase helper method
    upcase key = method call to upper case helper method
    neither key = count of characters minus the lowercase and uppercase counts
  - Return hash

=end

def calculate_lower_count(chars)
  selected_chars = chars.select do |char| 
                      next unless [*'a'..'z', *'A'..'Z'].include?(char)
                      char.downcase == char
                   end
  selected_chars.size
end

def calculate_upper_count(chars)
  selected_chars = chars.select do |char| 
                    next unless [*'a'..'z', *'A'..'Z'].include?(char)
                    char.upcase == char
                   end
selected_chars.size
end

def letter_case_count(str)
  characters = str.chars

  lower_count = calculate_lower_count(characters)
  upper_count = calculate_upper_count(characters)
  neither = (characters.size) - lower_count - upper_count

  { lowercase: lower_count, uppercase: upper_count, neither: neither }
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }