# # Problem: Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

# Input: One number
# Output: One number

# # Rules
# Explicit requirements:
# - Should use the method we wrote in the last problem
# - Method should be defined with one parameter
# - The method should square its argument

# # Test Cases:

# square(5) == 25
# square(-8) == 64

# # Algorithm
# - Paste multiply method
# - Define a squaring method that accepts one argument
#   - Inside the squaring method, call the multiply method with both arguments as the squaring's parameter
# - Call the squaring method

def multiply(x, y)
  x * y
end

def square(i)
  multiply(i, i)
end

p square(5) == 25
p square(-8) == 64