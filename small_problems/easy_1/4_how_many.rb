require 'pry'

# Problem: Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'Car', 'suv'
]

# count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# Input: an array
#   - containing string elements
# Output: a hash
#   - whose keys are the unique elements in the given array
#   - and whose values are the integers representing the number of times the keys appeared in the original array

# Explicit requirements: produce the data described above
# - elements in the given array are case sensitive
# Implicit requirements:
# - The hash keys should be strings
# - The hash values should be integers

# Example:

# count_occurrences(vehicles) # => {
                              #   'car' => 4, 
                              #   'truck' => 3,
                              #   'SUV' => 1,
                              #   'motorcycle' =>
                              #    }

# Data structure: input is an array, and should be one-dimensional before frequencies are calculated. Output is a hash containing elements of the original array as keys.

# Algorithm
# -Create an empty hash
# -Iterate through the given array
#   -If the current element exists as a hash key, add 1 to its values
#   -Otherwise, create a hash key whose value is the current element and give it a value of 1
# - Print the hash that was created

# Code

def count_occurrences(list)
  list.each_with_object({}) do |list_item, hash|
    if hash[list_item]
      hash[list_item] += 1
    else
      hash[list_item] = 1
    end
  end
end

print count_occurrences(vehicles)

# Why does typing in hash return a large Integer?
