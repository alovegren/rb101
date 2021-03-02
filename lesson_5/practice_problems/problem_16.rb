# Problem: Write a method that returns one UUID when called with no parameters.

# Example of UUID:

# "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Input: method call with no parameters
# Output: String

# Rules:
# - The string should be grouped into sections using the following guideline, where each number represents the number of characters in each section:
#   - 8-4-4-4-12
# - Each section is separated by a dash as shown above
# - The sections should be made up of hexadecimal characters
#   - Hexadecimal is a way of representing numbers using a base of 16
#   - "0" - "9" represents 0-9 and 'a' - 'f' represents 10 to 15.

# # Algorithm
# - Create a hexadecimal range constant
# - Define a method with no parameters
  # - Create an array containing the integers which represent the proper grouping of the UUID
  # - Create an empty array for storing the in-progress UUID string
  # - Iterate through the array
  #   - Create an empty string for storing the current UUID subsection
  #   - For each number, loop that many times
  #     -Add a character from the hexadecimal range to the current subsection
  # - Once each of the subsections is complete, join all the elements of the UUID string array together with dashes between the segments

HEX = [*'0'..'9', *'a'..'f']
UUID_SEQUENCE = [8, 4, 4, 4, 12]

def uuid
  uuid_array = []

  UUID_SEQUENCE.each do |section_number|
    subsection = ''
    section_number.times { |i| subsection << HEX.sample }
    uuid_array << subsection
  end
  
  uuid_array.join('-')
end

p uuid
    


