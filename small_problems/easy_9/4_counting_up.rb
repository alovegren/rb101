=begin

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.


Problem
- Given a integer greater than 0, return an array of integer from 1 to the given integer, inclusive
- Given 1, return an array containing 1
- Data validation not needed

Data Structure
- Range, array, integer

Algorithm
- Define a range from 1 to the number, inclusive
- Iterate over it
  - Add the current value of the iteration to an array
- Return the array

Further Exploration: What should the method return if a negative integer is given?
- The sequence from that number to 1
  - e.g. -5 -> [-5, -4, -3, -2, -1, 0, 1]
=end

def sequence(int)
  if int > 0
    start, stop = [1, int]
  else
    start, stop = [int, 1]
  end

  (start..stop).each_with_object([]) { |current_num, arr| arr << current_num }
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1) == [-1, 0, 1]
p sequence(-5) == [-5, -4, -3, -2, -1, 0, 1]