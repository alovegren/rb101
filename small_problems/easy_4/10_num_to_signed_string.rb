require "pry"
# # Problem: Write a method that takes an integer, and converts it to a string representation.

# Input: Integer
# Output: String

# # Rules
# - The only change in rules from the last exercise to this one is that we can expect to get both positive and negative inputs (as well as zero)
# Implicit
# - We notice the return value of the first test case is +4321, so we assume that positive numbers should be converted to strings with leading + signs.

# # Test Cases

# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'

# # Data Structure/Algorithm
# - It seems much easier to include leading positive/negative signs in this exercise since we can check for values less than or greater than zero right off the bat
# Algorithm
# - Create a constant that references an array containing digit strings
# - Define a method with one parameter
#   - Define local variable for final string
#   - Define local variable for multiplier
#     - Set it equal to '+' if the given integer is above 0,
#     - '-' if the given integer is below 0,
#     - otherwise return '0'
#   - Define local variables for the current number and the remainder
#     - Start a loop
#       - Set the current number and remainder equal to calling divmod on the argument of the method
#       - Prepend the final string with the value of the digits array at the index of the remainder (mutating)
#       - Break out of the loop if the current number equals 0
#   - Return the final string

DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def signed_integer_to_string(int)
  final_str = ''

  if int > 0
    multiplier = '+'
  elsif int < 0
    multiplier = '-'
    int *= -1
  else
    return '0'
  end

  current_num = int

  loop do
    current_num, remainder = current_num.divmod(10)
    final_str.prepend(DIGITS[remainder])
    # binding.pry
    break if current_num == 0
  end

  multiplier + final_str
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
