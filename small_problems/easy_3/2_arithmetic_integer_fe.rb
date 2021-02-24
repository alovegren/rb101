# # Problem: Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# # Further exploration: Consider the following edge cases:
# - The user inputs 0
# - The user inputs a float
# - Let's also use a prompt method this time instead of manually putsing our prompts

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
# This time, the program should specify a 0 division error
# If the user inputs a float, the program should output a float

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

# # Algorithm
# - Define a prompt method

def prompt(message)
  puts "==> #{message}"
end

# - Prompt the user for the first number
# - Get their input

prompt('What is the first number?')
first_input = gets.chomp

# - If the string is a float, be sure to save it as a float
#   - Check that the string converted to a float converted back to a string is equal to the original input. If so, save it as a float
# - Otherwise, save it as an integer
# - Prompt the user for the second number

if first_input.to_f.to_s == first_input
  first_num = first_input.to_f
else
  first_num = first_input.to_i
end

# TEST

# puts first_num

# - Repeat the process above of checking whether input is a float and saving it accordingly
# - Get their input and save the reference to a variable

prompt('What is the second number?')
second_input = gets.chomp

if second_input.to_f.to_s == second_input
  second_num = second_input.to_f
else
  second_num = second_input.to_i
end

# TEST

# puts second_num

# Display each of the results below using string interpolation:
# - Add the two numbers
# - Subtract the second number from the first
# - Multiply the two numbers

prompt("#{first_num} + #{second_num} = #{first_num + second_num}")

# TEST above

prompt("#{first_num} - #{second_num} = #{first_num - second_num}")
prompt("#{first_num} * #{second_num} = #{first_num * second_num}")

# - Divide the first number by the second
#   - Add a rescue statement if ZeroDivision is thrown. Inform the user that a number cannot be divided by zero.
# - Calculate the remainder of dividing the first by the second
#   - Add a rescue statement if ZeroDivision is thrown. Inform the user that a number cannot be divided by zero.
# - Take the first to the power of the second

begin
  prompt("#{first_num} / #{second_num} = #{first_num / second_num}")
rescue
  prompt("Error. Cannot divide by zero.")
end

begin
  prompt("#{first_num} % #{second_num} = #{first_num % second_num}")
rescue
  prompt("Error. Cannot divide by zero.")
end