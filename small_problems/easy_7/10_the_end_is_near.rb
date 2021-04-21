=begin

Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

=end

def penultimate(str)
  str.split[-2]
end

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

=begin

Further Exploration
Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings that contain just one word, and strings that contain no words.

Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

Problem
- Retrieve the middle word of a phrase
- Edge cases
  - Phrases with an even number of words # => no middle error, or we could treat it like integer division e.g. "there are four words"
  - One word strings # => return that word e.g. "justoneword"
  - Empty strings # => return empty string

Algorithm
- Split phrase into words, divide qty of words by 2, return element at index of result unless the division resulted in no remainder. one word divided by two will have a remainder (one), so our one-word string will be returned. an empty string size (0) will not have a remainder, however, so we can write a guard clause for that

=end

def retrieve_middle(str)
  return str if str == ''
  word_count = str.split.size
  return str.split[word_count / 2] unless word_count % 2 == 0
  "There is no middle word."
end

p retrieve_middle('last word') == "There is no middle word."
p retrieve_middle('Launch School is great!') == "There is no middle word."
p retrieve_middle('there are five words here') == 'five'
p retrieve_middle('testedge') == 'testedge'
p retrieve_middle('') == ''