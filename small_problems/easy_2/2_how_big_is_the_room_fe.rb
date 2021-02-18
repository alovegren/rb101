# # Problem: Build a program that asks a user for the length and width of a room in feet and then displays the area of the room in square feet, square inches, and square centimeters

# # Input: two numbers (the length and width of a room)
# # Output: A string interpolated with three calculations:
# - The area of the room in square feet, square inches, and square centimeters

# # # Rules
# Explicit Requirements:
# - The program must prompt the user for input
# - The program must obtain two numbers
# - The program must display the result of those two numbers multiplied
# - - > area in sq. ft.
# - The program must display the result converted into two other units
# - - > area in sq. in.
# - - > area in sq. cm.
# Implicit Requirements
# - The results of the program must be interpolated within an output string
# - The results should be floats, since the decimal places are relevant in this scenario
# - The program should obtain the two input numbers separately

# # Example

# Enter the length of the room in feet:
# 10
# Enter the width of the room in feet:
# 7
# The area of the room is 70.0 square feet, or 10,080 square inches, OR 65, 032 square centimeters.

# # Algorithm
# - Save the sqft - > sq inches conversion factor as a constant
# - Save the sq inches - > sq centimeters conversion factor as a constant
# - Define a prompt method to distinguish prompts from user input
# - Prompt the user for the length of the room in square feet
#   - Save the input in a length variable
#   - Convert the string input into a float
# - Prompt the user for the width of the room in square feet
#   - Save the input in a width variable
#   - Convert the string input into a float
# - Save the result of multiplying the length times width into an area variable
#   - Round the resulting float to two places
# - Save the result of multiplying the area in sqft times inches conversion factor into a second area variable
#   - Round the resulting float to two places
# - Save the result of multiplying the area in inches times centimeter conversion factor into a second area variable
#   - Round the resulting float to two places
# - Print a string to the screen which interpolates
#   - the value of the square feet area variable
#   - the value of the square inches area variable
#   - the value of the square centimeters area variable

# # Let's code!

SQFT_TO_SQIN = 144
SQIN_TO_SQCM = 6.4516

def prompt(message)
  puts ">> #{message}"
end

prompt("Hello! Welcome to the area calculator. Please enter the length of your room in feet.")
length_feet = gets.chomp.to_f

prompt("Thanks! Now what about the width in feet?")
width_feet = gets.chomp.to_f

prompt("Excellent. Give me one moment while I peform the calculations...")

area_sqft = length_feet * width_feet

area_sqin = area_sqft * SQFT_TO_SQIN

area_sqcm = area_sqin * SQIN_TO_SQCM

prompt("Thanks for waiting. The area of your room is #{area_sqft.round(2)} square feet or #{area_sqin.round(2)} square inches OR #{area_sqcm.round(2)} square centimeters!")