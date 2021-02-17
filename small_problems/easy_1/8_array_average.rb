# Problem: Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

# Input: a non-empty array containing positive integers
# Output: an Integer

# Explicit requirements
# -The program should be written using a method that accepts one argument
# -The program should return the average of all numbers in the array
# -The program should use integer division to calculate the average

# Examples/Test Cases:

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# Data Structure:
#  -Array containing positive integers
#  -Calculated integer

# # Algorithmm
# -Define a method with one parameter
# -Sum all the elements in the supplied array
# -Divide the sum by the number of elements in the array

def average(numbers)
  (numbers.sum) / (numbers.size)
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Further Exploration

def average(numbers)
  (numbers.sum.to_f) / (numbers.size)
end

puts average([1, 6])