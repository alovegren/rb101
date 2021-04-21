=begin
Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

Problem
- Given two arrays, return a new array containing the product of each pair of numbers with the same indices

Input: 2 arrays
Output: 1 array

Algorithm
- Iterate from 0 to the size of the array, non-inclusive
  - Send the element at the index equivalent to the current integer in the iteration in the first array times that one in the second array, to a new array

=end

def multiply_list(arr1, arr2)
  (0...arr1.size).map { |idx| arr1[idx] * arr2[idx] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]