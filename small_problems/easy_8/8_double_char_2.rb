=begin
Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

Problem
- Given a string, return a new string with two copies of each consonant

Algorithm
- Adjust method from previous exercise:
- Create a consonants constant
- Expand block passed to map to only multiply char * 2 if char is included in the consonants constant

=end

CONSONANTS = ("a".."z").to_a + ("A".."Z").to_a - %w(a e i o u A E I O U)

def double_consonants(str)
  chars = str.chars.map do |char|
    if CONSONANTS.include?(char)
      char * 2
    else
      char
    end
  end

  chars.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""