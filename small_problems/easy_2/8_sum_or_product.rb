# Problem: Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Input: an integer greater than zero, and a string denoting a choice
# Output: a calculation made with the given integer and choice
#         a string which states this calculation

# # Rules:
# Explicit requirements
# - The program should prompt the user for an integer input greater than zero
# - The program should give the user a choice between two calculations
#   - The user can choose a sum or a product
# - Given an integer and a calculation choice, the program should take all of the integers between 1 and the given integer and either
#   - Sum them
#   - Or multiply them
# - The program should then display the results of the chosen calculation in a string message
# Implicit requirements
# - The promps should be distinguished from the user's input
# - The prompt should specify what the program is summing or multiplying (i.e. summing or multiplying all of the integers from 1 to the given one)

# # Examples/Test Cases

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# # Data Structure
# We can use a simple loop which stores the current sum or product at each iteration 


# # Algorithm
# - Define a method which sums all of the integers from 1 to a given integer, inclusive
#   - Create a counter and a current sum variable
#   - Loop as many times as the given integer, 
#   - Assigning the current sum variable equal to itself plus the current value of the counter
#   - Increment the counter by 1

# - Define a method which multiplies all of the integers from 1 to a given integer, inclusive
#   - Create a counter and a current product variable
#   - Loop as many times as the given integer, 
#   - Assigning the current product variable equal to itself times the current value of the counter
#   - Increment the counter by 1
#   - Return the sum

# - Prompt the user to enter an integer greater than zero
# - Store the input in a variable
# - Prompt the user to select between summing and multiplying
# - Store the choice in a variable
#   - Return the product

# - If the choice was sum,
#   - Call the sum method and pass the given integer as an argument
#   - Store the result
# - If the choice was multiply,
#   - Call the multiply method and pass the given integer as an argument
#   - Store the result

# - Display the result of whatever calculation was done in a prompt to the user

def sum_to(integer)
  current_number = 1
  current_sum = 0
  integer.times do
    current_sum += current_number
    current_number += 1
  end
  current_sum
end

def multiply_to(integer)
  current_number = 1
  current_product = 1
  integer.times do
    current_product *= current_number
    current_number += 1
  end
  current_product
end

def prompt(message)
  puts ">> #{message}"
end

prompt('Please enter an integer greater than 0:')
user_integer = gets.chomp.to_i

prompt("Enter 's' to compute the sum, 'p' to compute the product.")
user_choice = gets.chomp

if user_choice.start_with?('s')
  sum = sum_to(user_integer)
  prompt('The sum of the integers between 1 and ' + user_integer.to_s + ' is ' + sum.to_s)
elsif user_choice.start_with?('p')
  product = multiply_to(user_integer)
  prompt('The product of the integers between 1 and ' + user_integer.to_s + ' is ' + product.to_s)
end

