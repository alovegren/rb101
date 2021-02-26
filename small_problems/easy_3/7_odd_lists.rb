# # Problem: Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# Input: an array
# Output: an array

# # Rules
# Explicit Requirements:
# - The program should define a method with one parameter, which we expect to be an array
# - The program should return an array:
#   - Which contains every other value of the original array
#   - Beginning with the first element
# Implicit Requirements:
# - It is not stated whether the program should return a new array or the original one, but we feel it is safer to assume we should return a new one
# - Given an array with only one element, the program should return a copy of the same array
# - Given an empty array, the program should return an empty array

# # Examples/Test Cases:

# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []

# # Data Structure/Algorithm
# We are interested in every other value of the given array, beginning with the element at the first index. Those indices would be 0, 2, 4, 6, ... and so on, so we can simply say we want all of the even-numbered indices.

# Algorithm
# - Define a method with one parameter
# - Loop through the given array,
#   - Sending elements which meet our selection criteria to a new array
#   - Our selection criteria: is the current index of the array even?
#     - Access the index of the current element
#     - Check whether it is even

def oddities(array)
  array.select { |element| array.index(element).even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
