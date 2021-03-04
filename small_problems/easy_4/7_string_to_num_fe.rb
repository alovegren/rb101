# # Problem: Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

# Input: String
# Output: Integer

# We're going to use a hash to perform our conversion this time, as in the LS solution for the previous program

# # Test case:
# hexadecimal_to_integer('4D9f') == 19871

# # Algorithm
# - Create a constant containing a hash which maps string values from the hexadecimal number system to their corresponding integer values
#   - For fun, we're going to try to create this structure with an iterator
#     - Define a method with no parameters
#       - Initialize a counter at 0
#       - Iterate through the range '0'..'9'
#       - Send to a hash:
#       - A key/value pair where the key references the current value in the range, and the value references the current value of the counter
#       - Iterate through the range 'a'..'f'
#       - Send to a hash:
#       - A key/value pair where the key references the current value in the range, and the value references the current value of the counter
#     - Return the hash

def map_str_to_hex
  i = 0
  map = Hash.new

  ('0'..'9').each do |numstr|
    map[numstr] = i
    i += 1
  end

  ('a'..'f').each do |str|
    map[str] = i
    i += 1
  end
  map
end

HEX_MAP = map_str_to_hex

# - Define a method with one parameter
# - Create an empty array for the digits
# - Iterate through the characters of the given string
#   - Send to the digits array:
#     - The value of the hash at the key matching the current character
# - Return the digits array

def get_digits(str)
  digits = []
  str.chars.each { |char| digits << HEX_MAP[char.downcase] }
  digits
end

p get_digits('4D9f')

# - Convert the digits array into an Integer
#   - Initialize a value at 0
#   - Iterate through an array of digits
#     - Multiply the value by 16
#     - Add the current digit to the value
#   - Return the final value

def hexadecimal_to_integer(hexstr)
  integer_digits = get_digits(hexstr)
  final_int = 0
  integer_digits.each do |digit|
    final_int *= 16
    final_int += digit
  end
  final_int
end

p hexadecimal_to_integer('4D9f') # == 19871
