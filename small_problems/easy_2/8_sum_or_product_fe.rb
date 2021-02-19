# Problem: Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# # Further Exploration: add validation loops for user inputs and use the inject method to compute the sum and product

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

# - Prompt the user to enter an integer greater than zero
# - Store the input in a variable

# - Prompt the user to select between summing and multiplying
# - Store the choice in a variable

# - If the choice is addition,
# - Sum all of the integers from 1 to the given integer
#   - Define a range object from 1 to the given integer
#   - Iterate through the range
#     - Sum the numbers in the range, using an accumulator value and the current iteration's value

# - If the choice is multiplication,
# - Multiply all of the integers from 1 to the given integer
#   - Repeat the process defined above, ensuring that the initial value of the accumulator is 1 since we are multiplying

# - Display the result of whatever calculation was chosen in a prompt to the user

def prompt(message)
  puts ">> #{message}"
end

user_integer = nil

loop do
  prompt('Please enter an integer greater than 0:')
  user_integer = gets.chomp.to_i
  break if user_integer.is_a?(Integer) && user_integer > 0
  prompt('Invalid input.')
end

user_choice = ''

loop do
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  user_choice = gets.chomp
  break if user_choice.start_with?('s') || user_choice.start_with?('p')
  prompt("Invalid input.")
end

if user_choice.start_with?('s')
  sum = (1..user_integer).inject(:+)
  prompt('The sum of the integers between 1 and ' + user_integer.to_s + ' is ' + sum.to_s)
elsif user_choice.start_with?('p')
  product = (1..user_integer).inject(1, :*)
  prompt('The product of the integers between 1 and ' + user_integer.to_s + ' is ' + product.to_s)
end

# # Enumerable#inject

# Enumerable#inject has the following signatures:

# inject(initial, sym) → obj
# inject(sym) → obj
# inject(initial) { |memo, obj| block } → obj
# inject { |memo, obj| block } → obj

# The structure of this method reminds us of the code we used to build our product and sum methods:

# def multiply_to(integer)
#   current_number = 1
#   current_product = 1
#   integer.times do
#     current_product *= current_number
#     current_number += 1
#   end
#   current_product
# end

# In this method, we needed to initialize current_number and current_product variables. (We'll use the example of multiplying but note that addition is basically the same operation.) To generalize, when faced with multiplying a sequence of numbers, we need to keep track of the current multiplicand and the running total.

# In Enumerable#inject, we can think of the `memo` parameter as our running total. Indeed, `memo` is referred to in the documentation as an 'accumulator value,' which makes sense; it is the representation of the accumulation of our eventual product. On each iteration through the collection, we take this accumulator value and multiply it by the current element in our collection.

# Things to note about the different parameters:

# - We can pass the optional `initial` to specify a starting value for our operation.
# - `sym` must be a symbol argument which specifies the operation we're performing on the collection
# - We can also pass a block to inject, and the value of the block evaluated with the current iteration element and/or memo will become the new value for memo on the next iteration.

# Knowing this now, we return to our program to make it more *rubyish*