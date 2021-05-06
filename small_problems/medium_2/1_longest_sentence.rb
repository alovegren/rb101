=begin
Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

Problem
- Fiven a text file, output the sentence with the most words in the file, as well as the number of words in that sentence.
  - Sentences may end with periods, exclamation points or question marks
  - Anything not a space or ./!/? is considered part of a word
- Input: text file (string), output: string, return: doesn't matter

Ideas
- Iterate thru with counter and variable saving no. words, overwrite if a bigger counter is found at end of sentence
- Split string into array of words, iterate thru keeping track of index, return index when end of sentence is found

Algorithm
- Import text file -> string

- Helper method: given text, return array of indices signifying sentence ends
  - Split string by spaces into array of words
  - Initialize new array to contain indices of words with sentence stops
  - Iterate thru array, keeping track of index
    - Add index to array when a sentence stop is found (./!/?)

- Helper method: find two indices with the greatest difference
  - Input: array of indices, return: array of two consecutive indices
  - Find each pair of consecutive elements in the given array -> arr of subarrs
  - Sort the array of subarrays based on the differences between the second and first element
  - Return the last element in the sorted array


Main method
- Split given string into an array of words
- Given an array of two indices, the max index and its starting index
- Output given words, inclusive, from
  - The starting index plus one
  - To the max index
- Joined together by spaces

=end

def return_indices(txt)
  words = txt.split
  indices_arr = []

  words.each_with_index { |word, index| indices_arr << index if word.match(/\.|\?|\!/) }
  indices_arr
end

 def greatest_diff_indices(arr)
  all_pairs = arr.each_cons(2).to_a
  all_pairs.sort_by { |index_pair| index_pair[1] - index_pair[0] }.last
 end

 def longest_sentence(txt)
  stop_indices = return_indices(txt)
  greatest_difference_pair = greatest_diff_indices(stop_indices)

  words_greatest_qty = txt.split[(greatest_difference_pair[0] + 1)..greatest_difference_pair[1]]
  puts "#{words_greatest_qty.join(' ')} <--- #{words_greatest_qty.size} words long"
 end

text = File.read('sample_text.txt')
longest_sentence(text)