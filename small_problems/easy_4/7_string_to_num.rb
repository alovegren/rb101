# Problem: Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use #to_i or Integer()

# Input: String
# Output: Integer

# # Rules
# Explicit
# - Program should define a method with one param
# - Given a string representing an integer,
# - Return that integer
# - Assume inputs will not include leading + or - nor be non-numeric
# - Do not use #to_i or Integer()

# # Test Cases

# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

# # Data Structure
# The key to this problem is recalling that strings can be compared to one another using <=>, and will generate the expected results due to the fact that the strings representing each integer are in ascending order in ASCII tables.
# We can create a loop with an iteration value, which compares strings in the range 0..9 with the current digit in the argument. Once <=> returns 0, we know that the current value of the iterator corresponds with the string in question.
# We can add each integer we find to an array. Once that array is complete, we need to join together the integers to make the original number. Since we can't easily join integers together like this, we must think about the relationship between digits in a number and the whole number. Take 4,268:

#      4    ,   2      6       8
#   4*1,000   2*100   6*10    8*1

# Now let's think about 4268 as a string and visualize the indices of its digits:

# Forwards:    0        1      2       3
#              4    ,   2      6       8    
# Backwards:  -4       -3     -2      -1

# Now, we can generalize the relationship between the indices of the digits and their corresponding identities as the ones place, tens place, etc. Where n is the index of a string and d is the digit:

# value = d * 10**-(n+1)

# Using the index and digit, we can come up with a value for the ones, tens, hundreds... etc. place, and simply sum those values together to arrive at the final integer value

# # Algorithm
# - Create digits array:
  # - Create an empty array for the digits
  # - Iterate through the given string
  #   - Initialize a counter at 0
  #   - Iterate through the range of '0'..'9'
  #   - Break if the current value of the given string <=> the current value of the range equals 0
  #   - Increment the counter by 1
  #   - Add the counter to the digits array
  # - Return the digits array

def string_to_digits(string)
  digits = []
  string.each_char do |char|
    i = 0
    ('0'..'9').each do |numstr|
      break if (char <=> numstr) == 0
      i += 1
    end
    digits << i
  end
  digits
end

# - Join digits together
# - Define a method with one parameter
#   - Initialize a final integer variable at zero
#   - Iterate through the given digits array
#   - For each value in the array,
#     - Find the proper multiple of 10
#     - Multiply the value of the digit by the proper multiple of 10
#     - Add the result to the final integer variable
# - Return the final integer

def string_to_integer(str)
  digit_arr = string_to_digits(str)
  final_integer = 0
  digit_arr.each_with_index do |digit, index|
    place = digit * 10**-(index - (digit_arr.size - 1))
    final_integer += place
  end
  final_integer
end

p string_to_integer('3456') == 3456
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

