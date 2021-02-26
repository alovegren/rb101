# # Problem: The || operator returns a truthy value if either or both of its operands are truthy, a falsey value if both operands are falsey. The && operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey. This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

# In this exercise, you will write a function named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

# Input: Any two expressions
# Output: Boolean

# # Rules:
# Explicit requirements:
# - The program should define a method which takes two arguments
# - The program should only return true if exactly one of its arguments has a truthy value
# - Otherwise, it should return true
# - The program should only return boolean results

# Implicit requirements
# - The arguments can be any type of object

# # Examples/Test Cases:

# xor?(5.even?, 4.even?) == true
# xor?(5.odd?, 4.odd?) == true
# xor?(5.odd?, 4.even?) == false
# xor?(5.even?, 4.odd?) == false

# # Data Structure: If I'm recalling correctly, this can be accomplished with the right combination of and/or gates. 

# Given two options x and y, what we want is (!x && y) OR (x && !y). So we can write this function using a combination of two and gates, two not gates, and an or gate.

# # Algorithm
# - Define a method with two parameters, p1 and p2
# - Return true if
#   -(p1 is false AND p2 is true) OR (p2 is false AND p1 is true)
# - Otherwise,
#   - Return false

def xor?(arg1, arg2)
  return true if (arg1 && !arg2) || (!arg1 && arg2)
  false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false