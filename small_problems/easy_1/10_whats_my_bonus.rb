# Problem: Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

# Input: Two arguments, an integer and a boolean
# Output: An integer
#         - One half the given integer if the boolean is true
#         - Otherwise, zero

# Explicit requirements: 
# - The program should be written as a method with two parameters
# - The program should return an integer

# Implicit requirements:
# - The method parameters should not have defaults
# - The method should merely calculate a bonus, and not print anything to the screen

# Examples/Test Cases

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

# Data structure: Two logic gates should be enough here

# Algorithm
# - Define a method with two parameters
# - Check the second parameter
#   - If it is true, return half of the first parameter
#   - If it is false, return zero

  # Code

  def calculate_bonus(int, boolean)
    boolean ? (int / 2) : 0
  end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000