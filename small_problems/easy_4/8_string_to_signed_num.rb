require "pry"

# # Problem: Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

# Input: String
# Output: Integer

# # Rules
# - The only new rule is that the argument passed to the method may include a + or -

# # Test Cases:
# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

# # Algorithm
# - Create a constant containing a hash which maps string values to their corresponding integer values
#   - For fun, we're going to try to create this structure with an iterator
#     - Define a method with no parameters
#       - Initialize a counter at 0
#       - Iterate through the range '0'..'9'
#       - Send to a hash:
#       - A key/value pair where the key references the current value in the range, and the value references the current value of the counter
#     - Map '-' to -1
#     - Return the hash

def map_str_to_hex
  i = 0
  map = Hash.new

  ('0'..'9').each do |numstr|
    map[numstr] = i
    i += 1
  end

  map['-'] = -1
    
  map
end

HEX_MAP = map_str_to_hex

# Combine get_digits and string_to_integer so negative multipliers are accessible to final method
# - Create an empty array for digits
# - Initialize a final integer value at 0
# - Create a multiplier value for the possibility of a negative sign

# - Iterate through the characters of the given string
#   - Delete any leading '+'
#   - Send to the digits array:
#     - The value of the hash at the key matching the current character

# - Convert the digits array into an Integer
#   - Iterate through an array of digits
#     - If the current character is '-'
#       - Multiply multiplier by -1
#       - Skip to next iteration
#     - Multiply the value by 10
#     - Add the current digit to the value
#   - Return the final value times the multiplier

def string_to_signed_integer(str)
  digits = []
  final_int = 0
  multiplier = 1

  str.chars.each do |char|
    next if char == '+'
    digits << HEX_MAP[char.downcase]
  end

  digits.each do |digit|
    if digit == -1
      multiplier *= digit
      next
    end  
    final_int *= 10
    final_int += digit
  end

  final_int * multiplier
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100