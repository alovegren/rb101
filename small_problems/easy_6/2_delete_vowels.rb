=begin
# Problem
Write a method which, given an array of strings, returns an array of the same strings except with all of the vowels removed.

Input: Array
Output: Strings

Rules:
- Method takes array of strings as an argument
- Method returns array of strings
- In each string in each array, there must be no vowels
- Given a string containing only vowels, populate the array with an empty string in its place
- Preserve capitalization

Examples:
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

Algorithm
- Iterate through the strings in the array:
  - Break up the characters in the current string
  - Iterate through the characters:
    - Select the character and return it to a new array if it is not a vowel
  - Join the new array of characters back together
- Return a new array with the updated strings
=end

VOWELS = %w(A a E e I i O o U u)

def string_sans_vowels(str)
  consonants_arr = str.chars.reject { |char| VOWELS.include?(char) }
  consonants_arr.join
end

def remove_vowels(arr)
  arr.map do |str|
    string_sans_vowels(str)
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']