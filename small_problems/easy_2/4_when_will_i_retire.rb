# # Problem: Build a program that displays when the user will retire and how many years she has to work till retirement.

# # Rules
# Input: two integers
# Output: two strings, interpolated with calculations made using the input

# Explicit requirements:
# - The program should prompt the user for their age
# - The program should prompt the user for their retirement age
# - The program should display the current date, and the date that the user will retire
# - The program should tell the user how many years of work they have remaining
# Implicit requirements:
# - The numbers used in this program should be integers
# - The outputs should be interpolated within strings

# # Example

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

# # Algorithm
# - Define a constant for the current year (built-in?)
# - Prompt the user for their age
# - Save the input as an age variable
#   -Convert the input string to an integer
# - Prompt the user for the age at which they would like to retire
# - Save the input as a retirement age variable
#   -Convert the input string to an integer
# - Perform the necessary calculations
#   - Subtract the user age from the retirement age to get the amount of working years left
#   - Add the amount of working years to the current year to get the retirement year
# - Output a string to the screen
#   - State the current year
#   - State the retirement year
#   - State the amount of working years left

CURRENT_YEAR = Time.new.year

puts ">> What is your age?"
age = gets.chomp.to_i

puts ">> At what age would you like to retire?"
retirement_age = gets.chomp.to_i

working_years_left = retirement_age - age
retirement_year = CURRENT_YEAR + working_years_left

puts ">> It is #{CURRENT_YEAR}. You will retire in #{retirement_year}."
puts ">> You only have #{working_years_left} years to go!"