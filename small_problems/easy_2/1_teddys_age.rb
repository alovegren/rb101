# Problem
# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

# Input: A range of numbers
# Output: A random number
#   - We output to the screen a string including an interpolated version of the random number

# Explicit requirements:
#   - The program should randomly generate a number which we'll call 'Teddy's age
#   - The program should print a string to the screen including a string form of our random number.
#   - The random number should be somewhere between 20 and 200
# Implicit requirements:
#   - The number should be an integer, since it is an age.

# Example
# Output: Teddy is 69 years old!

# # Algorithm
# - Generate a random number
# - Print that random number within a string

puts "Teddy is #{rand(20..200)} years old!"

# Further Exploration

# Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use "Teddy" as the name if no name is entered.

# # Additional Rules
# - Prompt the user for a name
# - Get the user's input
# - If they give a name, use that name in the age message
# - Otherwise, use the name Teddy

# # Input
# - Optional string
# # Output
# - Same as before, with the addition of the user's name if they put one in

# # Algorithm
# - Write a prompt message
# - Define a method
# - Set the default of the argument equal to 'Teddy'
# - Within the method definition,
#   - Get the user's input
#   - Store the input in a variable
#   - Set the user name variable equal to the user's input
#   - If the input is an empty string, set the name back to 'Teddy'
#   - Interpolate the name variable within the string instead of the static 'Teddy' substring

def someones_age(name='Teddy')
  name = 'Teddy' if name.size < 0
  puts "#{name} is #{rand(20..200)} years old!"
end

puts ">> Hello! What is your name?"
user_name = gets.chomp

someones_age(user_name)
