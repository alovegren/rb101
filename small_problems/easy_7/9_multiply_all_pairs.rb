=begin

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Problem
- Input: 2 arrays, return: 1 array
- Given two arrays, return a new array containing the product of each pair of numbers
  - Where each pair is formed using one element from each array
- The resulting array should be sorted in ascending order
- Retain duplicates

e.g.

[2, 4] & [4, 3, 1, 2] ->

[ 2*4, 2*3, 2*1, 2*2, 4*4, 4*3, 4*1, 4*2 ] = [8, 6, 2, 4, 16, 12, 4, 8] = [2, 4, 4, 6, 8, 8, 12, 16]

Algorithm
- Iterate through the first of the arrays. On each index of the iteration, multiply the element at the current index by each one of the elements in the second array, in turn. Send each of the results to a new array. Sort the array

- Initialize final array
- Iterate through first array
  - Iterate through second array
    - Send result of multiplying each of the current elements to the final array
- Sort the final array

=end

def multiply_all_pairs(first_arr, second_arr)
  all_pairs_multiplied = []
  first_arr.each do |first_arr_elem|
    second_arr.each { |second_arr_elem| all_pairs_multiplied << first_arr_elem * second_arr_elem }
  end

  all_pairs_multiplied.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]


def multiply_all_pairs2(first_arr, second_arr)
  first_arr.product(second_arr).map { |num_pairs| num_pairs[0] * num_pairs[1] }.sort
end

p multiply_all_pairs2([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]