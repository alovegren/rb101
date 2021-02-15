words = "the flintstones rock"

def titleize(string)
  split_words = string.split
  capitalized_words = split_words.map { |word| word.capitalize }
  capitalized_words.join(' ')
end

# Problem: Write a method that takes a string argument, and outputs a new string that has each of the 'words' capitalized as it would be in a title.

# We might ask how a 'word' is defined in this problem. We will assume it is a grouping of letters delimited by index 0 of the string, whitespace characters, or the last index of a string.

# Input: a string
# Output: a string, containing the same 'words' present in the input, but in sentence case.

# Explicit requirements: 
  # Write a method which creates a string that has each word capitalized as it would be in a title

# Implicit requirements:
  # The method should return a new string
  # The method should transform each 'word' into a capitalized version of itself, regardless of its initial case status (uppercase, lowercase, capitalized)
  # A word is defined as a substring of the given string which is delimited by index 0 of the given string, a whitespace character, or the last index of the string.
  # If an empty string is given, an empty string shall be returned

# Test cases:
p titleize(words) # => "The Flintstones Rock"
p titleize('ewstoi sgoe aooooo') # => 'Ewstoi Sgoe Aooooo'
p titleize('') # => ''
p titleize('Already Titleized') # => 'Already Titleized'
p titleize('partially Titleized') # => 'Partially Titleized'
p titleize('ALL CAPS?') # => 'All Caps?'
p titleize('oneword') # => 'Oneword'
p titleize('S i n g l e c h a r a c t e r s') # => 'S I N G L E C H A R A C T E R S'

# Data structures: input is a string, output is a new string.