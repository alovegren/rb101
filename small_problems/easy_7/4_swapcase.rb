=begin

Problem: Write a method that swaps the cases of a given string

Input: String
Output: New String

Rules:
- Given a string, each lowercase letter in that string should be uppercase in the new string
- And vice versa (each uppercase -> lowercase)
- Non-alphabetic characters can stay unchanged

Examples:
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

Data Structure
String, split into array containing single character string

Algorithm
- Split string into characters array
- Iterate through characters, building new array
  - If the character is downcase, send an upcase char to new arr
    - i.e. if a downcase version of the string equals itself
  - If the character is upcase, send a downcase char
    - i.e. if an upcase version of the string equals itself
  - Otherwise, send the same char
- Join the new array back together into a string and return it

=end

def swapcase(str)
  chars_arr = str.chars
  
  new_chars = chars_arr.map do |char|
    if char == char.downcase
      char.upcase
    elsif char == char.upcase
      char.downcase
    else
      char
    end
  end

  new_chars.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'