# Problem: Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# Input: a positive Integer
# Output: an array
#   -For an Integer input of n places, the array contains n elements representing the value of the original integer at the ones place, tens place, hundreds place... etc. up to the nth place.

# Explicit requirements: 
# - method should return an array containing integers, given an integer
# - given integer should be positive

# Implicit requirements:
# - the array ought to be one-dimensional
# - the array need only have one or more element(s)

# Examples:

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# Data structure:
# -An integer input and array Output
# -The array is constructed from the digits of the given integer

# Algorithm:
# - Create an empty array
# - Split integer into separate digits
#   - First, convert integer to string
#   - Then, split the string into single characters
#   - Then, convert those characters back to integers
# - Send those digits to the empty array

def digit_list(integer)
  character_array = integer.to_s.split('')
  character_array.map { |character| character.to_i }
end

# We elected to use Array#map to convert our array of characters to Integers, because we recalled that #map is a good method to use for transforming a collection. The method considers the return value of the block, and assigns each element from the original array to a new array using this return value. An array with the same number of elements as self is returned by the method.

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# The Idiomatic Ruby approach:

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

# String#chars returns an array of characters in str. '(&:to_i)' is throwing us for a bit of a loop-- especially since Array#map is supposed to only accept a block or no argument at all-- but we have a feeling this is a keyword argument.

# Stackoverflow tells us that the & keyword signals to the #map method that we are passing in the following pre-defined block to the method. In other words, we are invoking #map, and for each element in the array returned by number.to_s.chars, we pass the return value of to_i to the method.
