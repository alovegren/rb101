=begin

Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

Problem
- Given a string, return an array containing each word in the string plus its length
  - Lengths should be appended to their corresponding strings with a space
    - e.g. 'parrot' -> ['parrot 6']
  - Words are separated by one space
- Input: string, output: array of strings

Data Structure
- Array of words, strings

Algorithmm
- Separate string into array of words, iterate through words and add the current word plus a space, plus the length to a new array. Return the array

- Separate string into words arr
- Iterate over it
  - On the current iteration, add word plus space plus length to a new array
- Return the new array
=end

def word_lengths(str)
  str.split.each_with_object([]) { |word, array| array << word + ' ' + word.length.to_s }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []