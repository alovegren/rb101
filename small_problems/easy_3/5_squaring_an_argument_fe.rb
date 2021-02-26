# # Problem: Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

# Further Exploration
# What if we wanted to generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?

# Input: 1 number, the base and another, the power to which we want to raise the base
# Output: 1 number

# # Rules:
# Explicit requirements: 
# - The method should take two arguments:
#   - The base
#   - n, the power
# - The method should return the base to the nth power
# - The multiply method from the previous exercise should be used

# # Test cases:

# power(9, 9) == 387420489
# power(9, 0) == 1
# power(0, 9) == 0

# # Data Structure
# For n ** p, p many rows:
#   n * n
#   ^^^^^
#   product * n
#   ^^^^^^^^^^^
#     product * n
#   ^^^^^^^^^^^^^
#                  etc...
# Note: Initial product should be 1 to account for n ** 0

# # Algorithm
# - Initialize product at 1
# - Start a loop
# - p many times:
#   - Set new product equal to product times n, using multiply()

def multiply(x, y)
  x * y
end

def power(n, p)
  product = 1
  counter = p
  until counter == 0
    product = multiply(product, n)
    counter -= 1
  end
  product
end

p power(2, 4) == 16
p power(9, 9) == 387420489
p power(9, 0) == 1
p power(0, 9) == 0