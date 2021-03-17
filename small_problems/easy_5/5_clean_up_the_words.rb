# # Given a string consisting of lowercase letters and non-alphabetic characters, write a method that returns the string with all non-alphabetic characters replaced by spaces. If there are more than one non-alphabetic characters in a row, they should only be replaced with one space.

# Input: String
# Output: String

# Rules
# - Solution should be written as a method
# - With one parameter
# - Wherever there are non-alphabetic characters, there should be a space instead
#   - Multiple non-alphabetic characters in a row should be replaced with only one space
#   - In other words, there should not be two spaces in a row
# - Punctuation need not be preserved
# - Edge case: If the string ends in a non-alphabetic character, there should be a space at the end (#join may not work)
# - Edge case: Same if the string begins with a non-alphabetic character 

# # Example
# cleanup("---what's my +*& line?") == ' what s my line '

# # Algorithm
# - Define a method with one parameter
# - Create an array to prepare the final string
# - Iterate through the characters of the string
#   - Add the current character to the array if it is alphabetic
#   - Otherwise, add a space
#     - Unless there is already a space there
# - Join all of the characters together to form the final string

def cleanup(str)
  final_chars = []

  str.chars.each do |char|
    if ('a'..'z').include?(char)
      final_chars << char
    else
      final_chars << ' ' unless final_chars.last == ' '
    end
  end
  
  final_chars.join
end

p cleanup("---what's my +*& line?") == ' what s my line '