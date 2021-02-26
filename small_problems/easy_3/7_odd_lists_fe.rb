require "pry"

# # Problem: Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# # Further Exploration
# Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.

# Try to solve this exercise in at least 2 additional ways.

# Input: an array
# Output: an array

# # Rules
# Explicit Requirements:
# - The program should define a method with one parameter, which we expect to be an array
# - The program should return an array:
#   - Which contains every other value of the original array
#   - Beginning with the second element
# Implicit Requirements:
# - It is not stated whether the program should return a new array or the original one, but we feel it is safer to assume we should return a new one
# - Given an array with only one element, the program should return a copy of the same array
# - Given an empty array, the program should return an empty array

# # Examples/Test Cases:

# oddities([2, 3, 4, 5, 6]) == [3, 5]
# oddities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities(['abc', 'def']) == ['def']
# oddities([123]) == []
# oddities([]) == []

# # Data Structure/Algorithm
# We are interested in every other value of the given array, beginning with the element at the second index. Those indices would be 1, 3, 5, ... and so on, so we can simply say we want all of the odd-numbered indices.

# Algorithm #1
# - Define a method with one parameter
# - Loop through the given array,
#   - Sending elements which meet our selection criteria to a new array
#   - Our selection criteria: is the current index of the array odd?
#     - Access the index of the current element
#     - Check whether it is odd
puts "===== First Algorithm ====="

def evenities(array)
  array.select { |element| array.index(element).odd? }
end

p evenities([2, 3, 4, 5, 6]) == [3, 5]
p evenities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evenities(['abc', 'def']) == ['def']
p evenities([123]) == []
p evenities([]) == []


# Algorithm #2
# - Define a method with one parameter
  # - Initialize a counter at 1
  # - Initialize an empty array for all elements at odd indices
  # - Loop through the given array,
  #   - Add the element at the counter's index
  #   - Add two to the counter
  #   - Break when the counter is equal to or grater than the size of the array

puts "===== Second Algorithm ====="

def evenities(arr)
  i = 1
  odd_indexed_elements = []
  while i < arr.size
    odd_indexed_elements << arr[i]
    i += 2
  end
  odd_indexed_elements
end

p evenities([2, 3, 4, 5, 6]) == [3, 5]
p evenities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evenities(['abc', 'def']) == ['def']
p evenities([123]) == []
p evenities([]) == []

# Algorithm #3
  # - Define a method with one parameter
  # - Initialize an empty array for all elements at odd indices
  # - Iterate through the given array supplying a block with each element and its index
  #   - Pass the current element to a method which checks if its index is odd
  #   - If the odd-checking method returns true, add the element to the odd-indexed elements array

puts "===== Third Algorithm ====="

def evenities(arr)
  odd_indexed_elements = []
  arr.each_index { |index| odd_indexed_elements << arr[index] if index.odd? }
  odd_indexed_elements
end

p evenities([2, 3, 4, 5, 6]) == [3, 5]
p evenities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evenities(['abc', 'def']) == ['def']
p evenities([123]) == []
p evenities([]) == []