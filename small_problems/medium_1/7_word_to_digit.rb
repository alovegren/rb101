require "pry"
=begin

Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Problem
- Given a string, return the same string with the digits 0..9 replaced with words one..nine
- If a punctuation mark is adjacent to the digit, it should be preserved

Data Structure
- Hash mapping digits to words
- Array of hash keys

Algorithm
- Create a hash mapping digits to words, iterate through keys in the hash and substitute any found values in the input string with their hash keys

- Hash mapping digits to words
  - Initialize hash
  - Initialize counter to 0
  - Iterate through an array of zero..nine
    - Set the hash key to the current counter value and the value to the current element in the array
    - Increment counter by one
  - Return hash

- Main method
  - Initialize result string
  - Iterate through digits to words hash
  - Overwrite result string with the result of substituting the current word in the string with its corresponding digit
- Return result string
=end

# def initialize_digits_to_words
#   word_map = {}
#   current_digit = 0

#   %w(zero one two three four five six seven eight nine).each do |current_word|
#     word_map[current_digit.to_s] = current_word
#     current_digit += 1
#   end

#   word_map
# end

# DIGITS_TO_WORDS = initialize_digits_to_words

# def word_to_digit(str)
#   result_str = str

#   DIGITS_TO_WORDS.each do |digit, word|
#     result_str = result_str.gsub(word, digit)
#   end

#   result_str
# end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


=begin

Further Exploration
There are many ways to solve this problem and different varieties of it. Suppose, for instance, that we also want to replace uppercase and capitalized words.

Can you change your solution so that the spaces between consecutive numbers are removed? Suppose the string already contains two or more space separated numbers (not words); can you leave those spaces alone, while removing any spaces between numbers that you create?

What about dealing with phone numbers? Is there any easy way to format the result to account for phone numbers? For our purposes, assume that any 10 digit number is a phone number, and that the proper format should be "(123) 456-7890".

Problem
- Add functionality to replace capitalized or uppercase words corresponding to digits
- Remove spaces between digits
  - Only those digits that are replaced with our method
- Format any ten digit numbers as phone numbers: "(956) 222-2222"

Ideas
- Helper method to adjust the current word in the map iteration
- Map number words to digits
  - If an adjusted version of the word is a hash key, map it to the return of gsub
- Helper method to format telephone numbers


Algorithm
- Helper: adjust a single word to a downcase, alphabetic version of itself
  - Input: word, output: word
  - Break the word into characters and downcase it
  - Select only those characters which are part of the alphabet
  - Join the characters back together

- Helper: format phone numbers
  - Input: ten digit number string, output: formatted number string
  - String interpolation using slices of the input string

- Main method
  - Break the input string into words
  - 

=end

# def initialize_digits_to_words
#   word_map = {}
#   current_digit = 0

#   %w(zero one two three four five six seven eight nine).each do |current_word|
#     word_map[current_digit.to_s] = current_word
#     current_digit += 1
#   end

#   word_map
# end

# DIGITS_TO_WORDS = initialize_digits_to_words

def format_words(str)
  words_arr = str.split

  words_arr.select! do |word|
    adjusted_word = word.chars.select { |char| ("a".."z").include?(char.downcase) }.join.downcase
    DIGITS_TO_WORDS.values.include?(adjusted_word)
  end

  word_to_digit(words_arr.join.downcase)
end

p format_words('Please call me at Five Five FIVE one two THREE Four. Thanks.') # == 'Please call me at 5551234. Thanks.'
# word_to_digit('I have 6 6 apples. If Peter gives me three five more apples, how many apples will I have?') == 'I have 6 6 apples. If Peter gives me 35 more apples, how many apples will I have?'
# word_to_digit('nine five six two two two two two two two') == "(956) 222-2222"