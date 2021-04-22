=begin
Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

Problem
- Given an array of containing at least one number, return the sum
  - Of the sum of each set of leading numbers
- In other words, each combination of integers beginning with the one at the first index <- sum their sums
- Input: Array, Return: Integer

Data Structure
- Within array -> Each consecutive subset of Integers beginning with the Integer at index 0

Algorithm
- Iterate through the array building sub-arrays. Each sub-array contains one of the combinations of integers described above. Sum the sub-arrays, then sum those sums

-Iterate from 1 to the size of the array where the current number represents a length
  - Send an array beginning with index 0 that is the current length^ to a new array
- Iterate through the new array of sub-arrays, summing up their sums using a running total while iterating

=end

def sum_of_sums(arr)
  leading_subs = (1..arr.size).map do |length|
    arr[0, length]
  end

  leading_subs.flatten.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35