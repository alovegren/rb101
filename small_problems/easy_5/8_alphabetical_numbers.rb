# # Problem: Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number.

# Input: Array
# Output: Array, Sorted

# # Rules
# - The solution should consist of one method
# - The method should accept an array of integers
#   - Between 0 and 19
# - The method should sort this array
#   - Based on the English word counterpart of each number
# - The method should return a new, sorted array, containing the same integers as the given one
# - (We assume a new array since the problem says to return 'an Array' and not 'the Array', but in an interview setting we would ask)

# # Examples
# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# # Algorithm
# - Create a hash whose keys are the Integers from 0..19 and whose values are their English word counterparts
#   - This hash should be a constant
# - Define a method which takes an array as an argument
#   - Sort the array,
#   - Passing in a block which compares the hash values of the current two elements

ALPHA_WORDS = %w(zero one two three four five six seven eight nine ten
                 eleven twelve thirteen fourteen fifteen sixteen seventeen
                eighteen nineteen)

i = 0
ALPHA_HASH = alpha_words.each_with_object({}) do |word, hash|
  hash[i] = word
  i +=1
end

def alphabetic_number_sort(arr)
  arr.sort { |a, b| ALPHA_HASH[a] <=> ALPHA_HASH[b] }
end

# We can simplify the above by using Enumerable#sort_by, which only requires one argument. Furthermore, we need not use a hash as a data structure since an array is already indexed. Using ##sort, we could have done something like..

def alphabetic_number_sort(arr)
  arr.sort { |a, b| ALPHA_WORDS[a] <=> ALPHA_WORDS[b] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Array#sort_by! would not have been appropriate because the problem wanted us to return a new array. Array#sort_by! sorts the given array in place, mutating it.