require "pry"
=begin

# Problem
Write a method that takes a string and returns a new string with every word capitalized

(Questions: should an all caps word be changed such that all but the first character are lowercase?)

Input: String
Output: New string

Rules:
Explicit
- Do not mutate passed object
Implicit
- Non-alphabetic starting characters can count as the first letter
  - e.g. the string "quoted" would stay the same, as "quoted" in the return string

Examples:
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

Data Structure: String, split into an array (over which we can iterate) and then joined back to a string

Algorithm 1
- Split string into array based on whitespace
- Helper method: Return array with words capitalized
  - Given array of strings,
  - Iterate through that array
    - Transform the current string into itself capitalized
- Join array of strings back together with spaces in between

=end

def capitalize_array(arr)
  arr.map { |word| word.capitalize }
end

def word_cap(str)
  str_arr = str.split
  capitalized_array = capitalize_array(str_arr)
  capitalized_array.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin

Further Exploration: two solutions without using capitalize

Algorithm #2
- Create alphabet hash which maps lowercase letters to uppercase letters
- Split string into array based on whitespace
- Helper method: Return array with words capitalized
  - Given array of strings,
  - Iterate through that array
    - Transform the current string into itself capitalized
      - Change the first character into the string to its corresponding hash value in the alphabet hash
- Join array of strings back together with spaces in between
=end

LOWER_TO_UPPER_MAP = { a: 'A', b: 'B', c: 'C', d: 'D', e: 'E', f: 'F', 
                       g: 'G', h: 'H', i: 'I', j: 'J', k: 'K', l: 'L',
                       m: 'M', n: 'N', o: 'O', p: 'P', q: 'Q', r: 'R',
                       s: 'S', t: 'T', u: 'U', v: 'V', w: 'W', x: 'X',
                       y: 'Y', z: 'Z' }

ALPHABET = ([("a".."z").to_a] + [("A".."Z").to_a]).flatten

def capitalize_first_letter(word)
  word_copy = word.dup
  word_copy[0] = LOWER_TO_UPPER_MAP[word[0].to_sym] if ALPHABET.include?(word[0])
  word_copy
end

def downcase_all_characters(word)
# if the current character is a value in the hash, make it the key.to_s

  downcase_chars = word.chars.map do |char|
                     char = LOWER_TO_UPPER_MAP.key(char).to_s if LOWER_TO_UPPER_MAP.has_value?(char)
                     char
                    end

  downcase_chars.join
end

def word_cap(str)
  words_arr = str.split
  capitalized_words = []

  words_arr.each do |word|
    word = downcase_all_characters(word)
    capitalized_words << capitalize_first_letter(word)
  end

  capitalized_words.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin
Algorithm #3
- Create a upper/lowercase hash
  - This time generate it with code
  - Create lowercase & uppercase arrays with range
  - Create new hash
  - Iterate through one array
    - Make new hash key current letter
    - Make hash value letter in other array at current index


- helper method: downcase all characters
  - given a word,
  - iterate thru the word's characters
    - if the character is an uppercase letter, make it the lowercase one that is found in the hash
  - return the word with characters adjusted

- helper method: capitalize the first word
  - Given a word, 
  - Make the first letter the hash value corresponding w/entry that is the current first letter
  - return the word

- Main method
  - Break string into array
  - Create new array for adjusted words
  - Iterate thru array
    - call downcase method on word
    - Call capitalize method on word if it starts with a letter
    - return adjusted word
  - Join array of adjusted words back together
=end

UPPER = ("A".."Z").to_a
LOWER = ("a".."z").to_a

LOWER_TO_UPPER_MAP = {}

UPPER.each_with_index { |upper_letter, idx| LOWER_TO_UPPER_MAP[LOWER[idx]] = upper_letter }

def downcase_word(wrd)
  downcased_word = wrd.chars.map do |char|
                     if LOWER_TO_UPPER_MAP.has_value?(char)
                       char = LOWER_TO_UPPER_MAP.key(char)
                     end
                     char
                   end

  downcased_word.join
end

def capitalize_word(wrd)
  wrd = wrd.clone
  wrd[0] = LOWER_TO_UPPER_MAP[wrd[0]]
  wrd
end

def word_cap(str)
  words_arr = str.split
  adjusted_words = []

  words_arr.each do |word|
    word = downcase_word(word)
    word = capitalize_word(word) if LOWER.include?(word[0])
    adjusted_words << word
  end

  adjusted_words.join(' ')
end

p word_cap('four score and seven')# == 'Four Score And Seven'
p word_cap('the javaScript language')# == 'The Javascript Language'
p word_cap('this is a "quoted" word')# == 'This Is A "quoted" Word'