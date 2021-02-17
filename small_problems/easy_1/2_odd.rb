# Problem: Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# Examples:

def is_odd?(integer)
  integer *= -1 if integer < 0
  integer % 2 == 1 ? true : false
end

# Because we recall the modulo operator having some interesting behavior with negative integers, we found the absolute value before testing with the modulo operator. In fact, we didn't need that line and could also do away with the ternary operator:

def is_odd?(integer)
  integer % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

# Data Structure: Integers
  # - Positive integers, zero, and negative integers are all valid inputs
  # - Boolean is returned based on whether the absolute value of the integer is even or odd

# Algorithm
# -Given an integer,
# -Find the absolute value of that integer.
#   -If it is less than zero, multiply by *1
#   -If it is zero or greater, no action is needed
# -Given the absolute value of the integer,
#   -Return true if dividing by two returns 1
#   -Return false otherwise

# We will code above the example cases.

puts '========Further exploration========'

# The solution explains that remainder operators can return negative results if the number on the left is negative. We are asked to rewrite the method using Integer#remainder instead of mod. We consult the ruby documentation and find some test cases:

# 5.remainder(3)     #=> 2
# -5.remainder(3)    #=> -2
# 5.remainder(-3)    #=> 2
# -5.remainder(-3)   #=> -2
# 5.remainder(1.5)   #=> 0.5

# We can see from the examples above that the remainder operation will work in our program so long as we test for a remainder of 0 instead of a remainder of 1.

def is_odd_remainder?(integer)
  integer % 2 != 0
end

puts is_odd_remainder?(2)    # => false
puts is_odd_remainder?(5)    # => true
puts is_odd_remainder?(-17)  # => true
puts is_odd_remainder?(-8)   # => false
puts is_odd_remainder?(0)    # => false
puts is_odd_remainder?(7)    # => true
