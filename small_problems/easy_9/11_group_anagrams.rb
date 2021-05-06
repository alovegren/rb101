# Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

=begin

Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)

Problem
- Given an array of words, output subsets of that array which contain words that are anagrams
  - Anagrams are one or more words containing the same letters
- The output should be arrays on new lines
- Input: array of words, output: multiple arrays w/subsets of words

Data Structure
- Arrays

Algorithm
- Iterate through words, select words on each iteration whose sorted value is the same as the current word but that has not already been picked. Output the array on each iteration

- Iterate through given array (top level)
  - Initialize a new array
  - Iterate again through given array (inner level)
    - Select the inner word if it is the same, sorted as the top level word, sorted
  - Add the selection to the final array if it is not already contained by the array

=end

def anagrams(arr)
  all_subsets = []
  
  arr.each do |top_word|
    current_subset = arr.select do |inner_word|
      top_word.chars.sort == inner_word.chars.sort
    end

    p current_subset unless all_subsets.include?(current_subset)
    all_subsets << current_subset
  end
end

anagrams(words)