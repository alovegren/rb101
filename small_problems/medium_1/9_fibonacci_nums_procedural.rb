require "pry"
=begin

Rewrite your recursive fibonacci method so that it computes its results without recursion.

Problem
- Given an integer, return the Fibonacci number at its place
  - The first and second fibonacci numbers are 1
  - All other numbers are the sum of the previous two numbers

1, 2, 3, 4, 5

# 1: [1] -> 1
# 2: [1, 1] -> 1
# 3: [1, 1, 2] -> 2
# 4: [1, 1, 2, 3] -> 3
# 5: [1, 1, 2, 3, 5] -> 5

Data Structure
- Array
- Range

Algorithm
- Initialize a new array
- Loop through the range from 1 to the given number
  - If the current number is less than or equal to two, add the integer 1 to the array
  - Otherwise, add the sum of the last element in the array and the penultimate element in the array, to the array
- Return the last number in the array

=end

def fibonacci(nth)
  fibonacci_nums = []

  (1..nth).each do |n|
    n <= 2 ? fibonacci_nums << 1 : fibonacci_nums << (fibonacci_nums[-1] + fibonacci_nums[-2])
  end
  fibonacci_nums.last
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501