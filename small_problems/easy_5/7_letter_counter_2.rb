# # Problem: Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

# Input: String
# Output: Hash

# Rules
# - The only additional rule is that non-alphabetic characters should not be counted when determining word size.

# # Examples
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}

# We need to add a step, before the word size is calculated, where we remove any non-alphabetic characters.

# # Algorithm
# - Create a new hash with a default value of 0
# - Delete non-alphabetic characters from the given string
# - Split the given string into an array using spaces as a delimiter
# - Iterate through the array, passing in the hash
#     - Add one to the hash value whose key is the size of the current word

def word_sizes(str)
  word_count = Hash.new(0)
  
  str.delete('^A-Za-z ').split.each_with_object(word_count) do |word, hash|
      hash[word.size] += 1
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}