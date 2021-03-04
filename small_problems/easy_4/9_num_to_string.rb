require "pry"
# # Problem: Write a method that takes a positive integer or zero, and converts it to a string representation.

# Input: Integer or 0
# Output: String

# # Rules
# Explicit
# - The program should define a method with one parameter
# - Given a positive integer or zero, the method should return a string representation of that integer
# - The program cannot use any built-in conversion methods

# # Test Cases

# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# # Algorithm
# - We'll rebuild our hash map approach from our hexadecimal and string to signed number solutions, reversing the mapping of string -> integer

# Build hash containing integers 0-9 as keys and their string counterparts as values
# - Define a method with no parameters
#   - Initialize a counter at 0
#   - Iterate through the range '0'..'9'
#     - Send a key/value pair to a new hash where the key is the current value of the counter, and the value is the current element in the range
#     - Add one to the counter
#   - Return the new hash
# Create a constant so that hash is accessible within methods

def map_integers
  i = 0
  ('0'..'9').each_with_object({}) do |str, hash_map|
    hash_map[i] = str
    i += 1
  end
end

INTEGER_MAP = map_integers

# Iterate through the given Integer argument, creating an array containing a string corresponding to each digit in the integer

# Address edge case: 0

# - Define a method with one param
#   - Create an array that will contain string representations of each digit
#   - Split the integer into digits and iterate over them
#   - Initialize a counter for the following loop at 1
#   - Create variable to hold current value of integer for dividing/modding. 
# Initialize at value of argument
#     - While current value is greater than 0
#       - Send the current value mod 10 to the digits array
#       - Divide the current value by 10 * counter
#       - Add 1 to the counter
#   - Reverse the array such that digits are in same order as given in argument
# Create a new array containing the string representations of each integer in the correct order
# - Create a new array for the string representations
# - Iterate through digits
#   -  For each value in digits, send a value to a new array where:
#     - The new string value is equal to the value of the integer map hash at the key corresponding to the current digit
#   - Return the new array
# Test
# Join the contents of the array together to create a final output string

def integer_to_string(int)
  digits = []
  working_integer = int

  if int == 0
    return INTEGER_MAP[int]
  end

  while working_integer > 0
    digits << working_integer % 10
    working_integer /= 10
  end

  digits.reverse!

  strings = digits.each_with_object([]) do |digit, str_array|
              str_array << INTEGER_MAP[digit]
            end

  strings.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'