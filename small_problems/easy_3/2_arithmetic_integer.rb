# # Problem: Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# Input: 2 positive integers
# Output: 6 strings displaying calculations made with the 2 integers

# # Rules
# Explicit requirements:
# - The program should prompt the user for two positive integers
# - The program should perform the following operations using the two positive integers:
    # - Addition
    # - Subtraction
    # - Multiplication
    # - Division
    # - Remainder
    # - Power
# The program should display the results of each of the operations
# The program need not validate the user's input

# Implicit requirements:
# - The propmt should be distinguishable from the user's input
# - The program should display the integers and the operation in the following format:
    # - x # y = z, where # is the operation performed

# Example:

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

# Algorithm
# - Prompt the user for the first number
# - Get their input and save the reference to a variable
# - Prompt the user for the second number
# - Get their input and save the reference to a variable

puts '==> Enter the first number:'
first_num = gets.chomp.to_i
puts '==> Enter the second number:'
second_num = gets.chomp.to_i

# Perform the following:
# - Add the two numbers
# - Subtract the second number from the first
# - Multiply the two numbers
# - Divide the first number by the second
# - Calculate the remainder of dividing the first by the second
# - Take the first to the power of the second
# Display each of the results above using string interpolation

puts "==> #{first_num} + #{second_num} = #{first_num + second_num}"
puts "==> #{first_num} - #{second_num} = #{first_num - second_num}"
puts "==> #{first_num} * #{second_num} = #{first_num * second_num}"
puts "==> #{first_num} / #{second_num} = #{first_num / second_num}"
puts "==> #{first_num} % #{second_num} = #{first_num % second_num}"
puts "==> #{first_num} ** #{second_num} = #{first_num ** second_num}"

# We could also iterate through an array containing the operators:
# # Algorithm
# Create an array containing strings representing the 6 operations
# Iterate through the array
# - For each element of the array, perform the current operation with the user's two numbers using Object#method

operators = %w(+ - * / % **)

operators.each do |operator|
  result = first_num.method(operator).(second_num)
  puts "==> #{first_num.to_s} #{operator} #{second_num.to_s} = #{result}"
end
