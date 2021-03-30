require 'pry'

# Problem:
# Given an integer representing a number of digits, return the index of the first Fibonacci number that reaches that number of digits. (assuming an array containing all Fibonacci numbers)

# Input: integer
# Output: integer

# Rules
# - Return an integer, representing an index of an array
# - Array contains fibonacci numbers
# - Fibonacci number at that index is the first number which has
# - The number of digits given in the argument

# Examples
# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847

# Algorithm
# - Create an array [1, 1]
# - Generate fibonacci sequence
#   - Sum the last two numbers in the array and add that sum to the array
#   - Check if that sum generated has the amount of digits specified
#     - Compare the length of the string version of the sum with the argument
#     - Return the sum if they're the same
#   - With the returned sum, return its index in the array

def has_digits?(num, digits)
  num.to_s.size >= digits
end

def find_fibonacci_index_by_length(num_of_digits)
  fibonacci_sequence = [1,1]
  current_num = nil

  loop do
    current_num = fibonacci_sequence[-1] + fibonacci_sequence[-2]
    fibonacci_sequence << current_num
    break if has_digits?(current_num, num_of_digits)
  end

  fibonacci_sequence.index(current_num) + 1
end

p find_fibonacci_index_by_length(2) # == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) # == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) # == 45
p find_fibonacci_index_by_length(100) # == 476
p find_fibonacci_index_by_length(1000) # == 4782
p find_fibonacci_index_by_length(10000) # == 47847