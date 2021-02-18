# # Problem: Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# # Input: two numbers (the length and width of a room)
# # Output: A string interpolated with two calculations:
# - The area of the room in meters and in square feet

# # # Rules
# Explicit Requirements:
# - The program must prompt the user for input
# - The program must obtain two numbers
# - The program must display the result of those two numbers multiplied
# - - > area in sq. meters
# - The program must display the result converted into another unit
# - - > area in sq. ft.
# Implicit Requirements
# - The results of the program must be interpolated within an output string
# - The results should be floats, since the decimal places are relevant in this scenario
# - The program should obtain the two numbers separately

# # Example

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

# # Algorithm
# - Save the meter - > sqft conversion factor as a constant
# - Define a prompt method to distinguish prompts from user input
# - Prompt the user for the length of the room in meters
#   - Save the input in a length variable
#   - Convert the string input into a float
# - Prompt the user for the width of the room in meters
#   - Save the input in a width variable
#   - Convert the string input into a float
# - Save the result of multiplying the length times width into an area variable
#   - Round the resulting float to two places
# - Save the result of multiplying the area times conversion factor into a second area variable
#   - Round the resulting float to two places
# - Print a string to the screen which interpolates
#   - the value of the square meters area variable
#   - the value of the square feet area variable

# # Let's code!

METERS_TO_FEET = 10.7639

def prompt(message)
  puts ">> #{message}"
end

prompt('Hi! Welcome to the area calculator.')
prompt('Please enter the length, in meters, of the room whose area you wish to calculate')

room_length_meters = gets.chomp.to_f

prompt('Great! Now please enter the width, in meters, of the room.')

room_width_meters = gets.chomp.to_f

prompt('Thank you. One moment while I calculate...')

area_meters = room_length_meters * room_width_meters
area_sqft = area_meters * METERS_TO_FEET

prompt("Thanks for waiting. The area of your room is #{area_meters.round(2)} square meters which is equal to #{area_sqft.round(2)} square feet.")