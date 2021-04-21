=begin
# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

Problem
- Given an integer n, find the difference between
  - The square of the sum of the range from 1..n
  - The sum of the squares of the integers from 1..n
  
Input/Return: Integer

# Examples:

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

Data Structure
- Range object (possibly convert to an array)

Algorithm
- Create two helper methods 
  - Sum of elements in range, squared
  - Sum of the elements, squared
- In main method, subtract the two

- Helper 1: Sum the range and square it
- Helper 2: Convert range to array,
  - Iterate through array
    - Map the current element to square of itself
    - Sum elements in new array
    
- Main method: call each helper method, find the difference

=end

def sum_squared(n)
  (1..n).sum ** 2
end

def squares_sum(n)
  squares = (1..n).to_a.map { |num| num ** 2 }
  squares.sum
end

def sum_square_difference(n)
  sum_squared(n) - squares_sum(n)
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150