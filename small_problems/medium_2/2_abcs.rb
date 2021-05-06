require 'pry'
=begin
# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Problem
- Given a string, return true or false based on whether
- The given string can be made from the blocks based on the following rules
  - The blocks are shown above. Each block is a colon-separated pair
  - Once either letter in the block appears in the string, neither letter may be used again
  
Data Structure
- Hash (key and value are both block characters)
- String -> array of chars

Algorithm
- Copy hash (helper method)
  - Initialize new hash
  - Iterate through elements in hash
    - send a copy of each key and value to the new hash
  - Return the new hash

=end

# [B,O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

BLOCKS = { 'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A', 'G' => 'T', 'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U', 'V' => 'I', 'L' => 'Y', 'Z' => 'M'}

def copy_hash(hsh)
  blocks_copy = {}
  BLOCKS.each { |k, v| blocks_copy[k.dup] = v.dup }
  blocks_copy
end


# Main method
# - Create copy of blocks hash with helper method
# - Iterate through characters in a string
#   - If the character is in the hash values
#     - Delete the block
#   - If the character is in the hash keys and its value is truthy
#     - Delete the block
#   - Otherwise,
#     - return false
# - Return true (meaning all characters have been found in the hash keys or values without invalid blocks being accessed)

def block_word?(str)
  blocks_copy = copy_hash(BLOCKS)
  
  str.upcase.chars.each do |char|
    if blocks_copy.values.include?(char)
      blocks_copy.delete(blocks_copy.key(char))
      next
    elsif blocks_copy.keys.include?(char)
      blocks_copy.delete(char)
      next
    else
      return false
    end
  end  
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true