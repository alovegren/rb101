=begin

Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

Problem
- Given two numbers, a count and the beginning of a sequence, return an array containing a sequence where
  - There are as many numbers as the count argument
  - The numbers in the sequence begin with the beginning argument and progress in multiples of that argument
- An empty array should be returned for a count of 0
- Some sequence of zeros should be returned if the beginning is 0
- If a negative beginning is given, the sequence should progress backwards on the number line
- e.g. 6, 3 -> 3, 6, 9, 12, 15, 18
- e.g. 3, -20 -> -20, -40, -60
- The count will be 0 or greater

Data structure
- Integers, range

Algorithm
- Iterate through a range from 1 to the count
  - Add the beginning number times the current iteration through count to a new array
- Return the new array

=end

def sequence(count, sequence_start)
  (1..count).map { |current_count| current_count * sequence_start }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []