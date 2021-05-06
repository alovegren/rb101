=begin

The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:

Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

Problem
- Given an integer, return the Fibonacci number at its place
  - The first and second fibonacci numbers are 1
  - All other numbers are the sum of the previous two numbers

Data structure
- Integers

Algorithm
- Return the given number if it is 1 or 2
- If not, sum the return value of:
    - recursively invoking the method at the index prior to the argument
    - recursively invoking the method at 2 indices prior to the argument 

=end

def fibonacci(int)
  return 1 if int <= 2

  fibonacci(int - 1) + fibonacci(int - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765