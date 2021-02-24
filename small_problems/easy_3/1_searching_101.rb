# # Problem: Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# Input: 6 integers
# Output: A String

# # Rules
# Explicit Requirements
# - The program prompts the user to enter a number six times
# - The program tells the user if the last number entered was included in the first five numbers entered
# Implicit Requirements
# - It is essential to validate the input so we are searching through data of the correct type
# - The prompt should specify that it is asking for the nth number

# Examples/Test Cases

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

# # Data Structure/Algorithm
# - Prompt the user for six numbers and store the first five values in an array
#   - Initialize an empty numbers array
#   - Create an array containing strings representing ordinal numbers
#   - Iterate through the ordinal number array
#     - Prompt the user for a number, interpolating the ordinal number into the prompt
#     - Validate the user's input
#       - If the input string converted to an integer converted to a string is equal to the original input string OR
#       - The input string converted to a float converted to a string is equal to the original input string,
#       - Break out of the loop
#       - Otherwise, print an error message
#     - Once valid, add the input to the integers array

user_numbers = []
ordinal_numbers = %w(1st 2nd 3rd 4th 5th last)

ordinal_numbers.each do |num|
  input = ''
  puts "==> Enter the #{num} number:"
  
  loop do
    input = gets.chomp
    break if input.to_i.to_s == input
    puts 'Invalid input. Please enter a number:'
  end

  user_numbers << input
end

# - Remove and store the last element of the array
# - Iterate through the integers array
#   - Create a new array containing elements that are equal to the last element

last_element = user_numbers.pop.to_i
match_array = user_numbers.select { |num| num == last_element.to_i }


# - If the new array was not empty, inform the user that the sixth given integer appears in an array of the first five integers
# - If the new array was empty, inform the user that the sixth given integer does not appear in an array of the first five integers

if match_array.size > 0
  puts "The number #{last_element} appears in #{user_numbers}."
else
  puts "The number #{last_element} does not appear in #{user_numbers}."
end
