=begin

Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

Problem
- Given an array of sub-arrays where each sub-array contains an item and a quantity,
- Return a new one-dimensional array containing as many repetitions of each item as specified by the quantity
- e.g. ['pear', 6] -> 'pear', 'pear', 'pear', 'pear', 'pear', 'pear'

Data structure
- arrays

Algorithm
- Create a new array
- Iterate through the given array
  - Repeat as many times as the second element in the current sub-array: add the first element to the new array
- Return the new array

=end

def buy_fruit(arr)
  arr.each_with_object([]) do |subarr, new_arr|
    subarr[1].times { |_| new_arr << subarr[0] }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]