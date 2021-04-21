=begin

Problem: Given a string, return another string in "staggered" case

Input: String
Output: New String

Rules
- Regardless of original case, characters should alternate between upper- and lowercase
- Non-alphabetic characters, including spaces, do count when alternating
Implicit
- First letter capitalized

Examples

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

Data Structure
- String, convert into an array of characters *preserving spaces*
- Iterate through this array keeping track of the current index (even/odd)

Algorithm
- Create array containing lower- and uppercase letters
- Split into an array preserving spaces
- Create new array for adjusted characters
- Iterate through array, keeping track of the index
  - Send the same character to the new array if not alphabetic (isn't part of an alphabet array)
  - If the current index is even
    - Send capitalized character
  - If it's odd,
    - Send downcased character

=end

# ALPHABET_ARRAY = [("a".."z").to_a + ("A".."Z").to_a].flatten

# def staggered_case(str)
#   chars = str.chars
#   adjusted_chars = []

#   chars.each_with_index do |char, idx|
#     unless ALPHABET_ARRAY.include?(char)
#       adjusted_chars << char
#       next
#     end

#     adjusted_chars << char.upcase if idx.even?
#     adjusted_chars << char.downcase if idx.odd?
#   end
  
#   adjusted_chars.join
# end
    
# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

=begin

Further Exploration Algorithm
- Define our method with a keyword parameter (default to true)
- Split into an array preserving spaces
- Create new array for adjusted characters

- Iterate through array
  - If the case status is true
    - Send capitalized character
  - If it's false,
    - Send downcased character
  - Flip the case status switch
=end

def staggered_case2(str, first_letter_cap: true)
  chars_array = str.chars
  adjusted_chars = []

  chars_array.map do |char|
    adjusted_chars << char.upcase if first_letter_cap
    adjusted_chars << char.downcase if !first_letter_cap

    first_letter_cap = !first_letter_cap
  end

  adjusted_chars.join
end

p staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('ALL_CAPS') == 'AlL_CaPs'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case2('I Love Launch School!', first_letter_cap: false) == 'i lOvE LaUnCh sChOoL!'
p staggered_case2('ALL_CAPS', first_letter_cap: false) == 'aLl_cApS'
p staggered_case2('ignore 77 the 444 numbers', first_letter_cap: false) == 'iGnOrE 77 tHe 444 nUmBeRs'