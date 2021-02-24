# # Problem: Create a method that takes two arguments, multiplies them together, and returns the result.

# Input: Two numbers
# Output: One number

# # Rules:
# Explicit requirements:
# - Write a method that takes two arguments
# - The arguments should be multiplied together
# - The result of the multiplication should be displayed

# Implicit requirements
# - We can assume the input should be numbers-- Integers or Floats

# Test Case
# multiply(5, 3) == 15

# Algorithm
# - Define a method with two parameters
# - Inside the method definition, multiply the two parameters
# - Call the method

def multiply(x, y)
  x * y
end

p multiply(5, 3) == 15
p multiply(144, 0) == 0
p multiply(%w(emmers lucille kitty tubster nubster chubster), [14, "frogs"] )