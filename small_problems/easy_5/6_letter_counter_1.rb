# # Problem: Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes. Words consist of any string of characters that do not include a space.

# Input: String
# Output: Hash

# Rules:
# - The method should accept any string
# - The method should return a hash where
#   - Each key represents the word length of a word
#     - The value represents the number of words in the given string that are the length of the key
# - Given an empty string, the method should return an empty hash

# # Examples:

# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}

# # Data Structure
# - Convert string to array,
# - Create new hash by iterating through array contents

# # Algorithm
# - Split string up into array using spaces as delimiter
# - Iterate through array, creating a new hash
#   - If the count of the current word is present in the hash keys
#     - Add one to that hash value
#   - Otherwise,
#     - Create a new key/value pair where the key is the current word count and the value is 1
# - Return the hash

def word_sizes(str)
  str.split.each_with_object({}) do |word, hash|
    if hash.keys.include?(word.size)
      hash[word.size] += 1
    else
      hash[word.size] = 1
    end
  end
end

# Instead of first checking whether the hash keys include the size of the current word, we can specify a default value for a hash key, including one that has not been explicitly created. If such a key is referenced, instead of the default `nil`, the specified value will be returned.

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}