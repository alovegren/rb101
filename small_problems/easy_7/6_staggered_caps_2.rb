require "pry"
# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

=begin
Algorithm

Main method
- Initialize a toggle variable to false
- Iterate through characters
  - Change toggle's value if the current character is alphabetic
  - Add upcase when toggle is false
  - Add downcase when toggle is true

=end

ALPHABET_ARRAY = [("a".."z").to_a + ("A".."Z").to_a].flatten


def staggered_case(str)
  chars = str.chars
  adjusted_chars = []
  toggle = true

  chars.each do |char|
    toggle = !toggle if ALPHABET_ARRAY.include?(char)
    adjusted_chars << char.upcase unless toggle
    adjusted_chars << char.downcase if toggle
  end
  
  adjusted_chars.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'